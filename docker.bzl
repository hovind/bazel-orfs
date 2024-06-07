def _impl(repository_ctx):
    docker_path = repository_ctx.path(repository_ctx.attr._docker).realpath
    image_archive = "data.tar"
    exec_result = repository_ctx.execute(
        [
            docker_path,
            "build",
            "--file",
            repository_ctx.attr.docker_file,
            "--output",
            "type=tar,dest={image_archive}".format(image_archive = image_archive),
            ".",
        ],
    )
    if exec_result.return_code != 0:
        fail(
            "Failed to build {docker}:".format(docker = repository_ctx.attr.docker_file),
            exec_result.stderr,
            sep = "\n",
        )

    for src, dest in repository_ctx.attr.strip_prefixes.items():
        repository_ctx.extract(archive = image_archive, stripPrefix = src, output = dest)

    if not repository_ctx.attr.strip_prefixes:
        repository_ctx.extract(archive = image_archive)

    repository_ctx.symlink(repository_ctx.attr.build_file, "BUILD")

docker_pkg = repository_rule(
    implementation = _impl,
    attrs = {
        "build_file": attr.label(mandatory = True),
        "docker_file": attr.label(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "strip_prefixes": attr.string_dict(),
        "timeout": attr.int(default = 600),
        "_docker": attr.label(
            doc = "Docker command line interface.",
            default = Label("@com_docker_download//:docker"),
            executable = True,
            cfg = "exec",
        ),
    },
)
