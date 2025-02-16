"""Yosys rules"""

def _yosys_impl(ctx):
    outs = []
    for k in dir(ctx.outputs):
        outs.extend(getattr(ctx.outputs, k))

    ctx.actions.run_shell(
        arguments = ctx.attr.arguments,
        command = ctx.executable._yosys.path,
        inputs = depset(
            ctx.files.srcs,
            transitive = [depset([ctx.executable._yosys])],
        ),
        outputs = outs,
    )

    return [
        DefaultInfo(
            files = depset(outs),
        ),
    ]

yosys = rule(
    implementation = _yosys_impl,
    attrs = {
        "_yosys": attr.label(
            doc = "Yosys binary.",
            executable = True,
            allow_files = True,
            cfg = "exec",
            default = Label("@docker_orfs//:yosys"),
        ),
        "arguments": attr.string_list(
            mandatory = True,
        ),
        "srcs": attr.label_list(
            mandatory = True,
            allow_files = True,
        ),
        "outs": attr.output_list(
            mandatory = True,
        ),
    },
    provides = [DefaultInfo],
)
