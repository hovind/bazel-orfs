def _copytree_impl(ctx):
    outs = []

    for f in ctx.files.srcs:
        before, sep, after = f.path.partition(ctx.attr.strip_prefix.strip("/") + "/")
        if not after:
            continue

        out = ctx.actions.declare_file(after)
        ctx.actions.symlink(output = out, target_file = f)
        outs.append(out)

    return [DefaultInfo(
        files = depset(outs),
    )]

copytree = rule(
    implementation = _copytree_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "strip_prefix": attr.string(
            mandatory = True,
        ),
    },
    provides = [DefaultInfo],
    executable = False,
)
