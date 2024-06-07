def _cc_patch(ctx, input):
    out = ctx.actions.declare_file(ctx.label.name)

    runfiles = ctx.runfiles(files = [])
    for dep in ctx.attr.deps:
        for link in dep[CcInfo].linking_context.linker_inputs.to_list():
            runfiles = runfiles.merge(ctx.runfiles([lib.dynamic_library for lib in link.libraries]))

    for dep in runfiles.files.to_list():
        link = ctx.actions.declare_file(dep.basename)
        ctx.actions.symlink(output = link, target_file = dep)
        runfiles = runfiles.merge(ctx.runfiles([link]))

    ctx.actions.run(
        arguments = ["--set-rpath", "$ORIGIN", "--output", out.path, input.path],
        executable = ctx.executable._patchelf,
        inputs = [input],
        outputs = [out],
    )

    return [DefaultInfo(
        executable = out,
        runfiles = runfiles,
        files = depset([out]),
    )]

def _cc_import_binary_impl(ctx):
    return _cc_patch(ctx, ctx.executable.executable)

def _cc_import_library_impl(ctx):
    [default] = _cc_patch(ctx, ctx.file.shared_library)
    return [DefaultInfo(
        runfiles = default.default_runfiles.merge(ctx.runfiles(files = default.files.to_list())),
        files = default.files,
    )]

cc_import_binary = rule(
    implementation = _cc_import_binary_impl,
    attrs = {
        "executable": attr.label(
            doc = "Executable to import.",
            mandatory = True,
            executable = True,
            allow_files = True,
            cfg = "exec",
        ),
        "deps": attr.label_list(
            allow_files = [
                ".ld",
                ".lds",
                ".ldscript",
            ],
            allow_rules = [
                "cc_library",
                "objc_library",
                "cc_proto_library",
                "cc_import",
            ],
            flags = ["SKIP_ANALYSIS_TIME_FILETYPE_CHECK"],
            providers = [CcInfo],
        ),
        "_patchelf": attr.label(
            doc = "Modify ELF files.",
            executable = True,
            allow_files = True,
            cfg = "exec",
            default = Label("@patchelf//:patchelf"),
        ),
    },
    provides = [DefaultInfo],
    executable = True,
)

cc_import_library = rule(
    implementation = _cc_import_library_impl,
    attrs = {
        "shared_library": attr.label(
            doc = "Executable to import.",
            mandatory = True,
            allow_single_file = [".so"],
            cfg = "exec",
        ),
        "deps": attr.label_list(
            allow_files = [
                ".ld",
                ".lds",
                ".ldscript",
            ],
            allow_rules = [
                "cc_library",
                "objc_library",
                "cc_proto_library",
                "cc_import",
            ],
            flags = ["SKIP_ANALYSIS_TIME_FILETYPE_CHECK"],
            providers = [CcInfo],
        ),
        "_patchelf": attr.label(
            doc = "Modify ELF files.",
            executable = True,
            allow_files = True,
            cfg = "exec",
            default = Label("@patchelf//:patchelf"),
        ),
    },
    provides = [DefaultInfo],
)
