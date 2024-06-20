load("@bazel-orfs//:cc.bzl", "cc_import_binary", "cc_import_library")

filegroup(
    name = "yosys",
    srcs = ["bin/yosys"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "share",
    srcs = glob([ "share/yosys/**"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "klayout_plugins",
    srcs = glob([
        "lib/klayout/db_plugins/*",
        "lib/klayout/lay_plugins/*",
    ]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "klayout_pymod",
    srcs = glob([
        "lib/klayout/pymod/**/*",
    ]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "mk",
    srcs = glob(["flow/**/*.mk", "flow/**/*.py", "flow/**/*.tcl", "flow/**/*.pl", "flow/**/*.script"]),
)

filegroup(
    name = "makefile",
    srcs = ["flow/Makefile"],
    data = [":mk"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "lib",
    srcs = glob(["flow/platforms/**/*.gds", "flow/platforms/**/*.lib.gz", "flow/platforms/**/*.lef", "flow/platforms/**/*.lib", "flow/platforms/**/*.lyt", "flow/platforms/**/*.rules", "flow/platforms/**/*.v"]),
    visibility = ["//visibility:public"],
)

cc_import(
    name = "ortools",
    shared_library = ":lib/libortools.so.9",
)

cc_import(
    name = "tclreadline",
    shared_library = ":lib/libtclreadline-2.3.8.so",
)

cc_import_binary(
    name = "openroad",
    deps = [
        ":ortools",
        ":tclreadline",
    ],
    executable = ":bin/openroad",
    visibility = ["//visibility:public"],
)

cc_import_binary(
    name = "sta",
    executable = ":bin/sta",
    visibility = ["//visibility:public"],
)

cc_import_library(
    name = "libklayout_tl.so.0",
    shared_library = ":lib/klayout/libklayout_tl.so.0",
)
cc_import_library(
    name = "libklayout_gsi.so.0",
    shared_library = ":lib/klayout/libklayout_gsi.so.0",
)
cc_import_library(
    name = "libklayout_lay.so.0",
    shared_library = ":lib/klayout/libklayout_lay.so.0",
)
cc_import_library(
    name = "libklayout_rdb.so.0",
    shared_library = ":lib/klayout/libklayout_rdb.so.0",
)
cc_import_library(
    name = "libklayout_laybasic.so.0",
    shared_library = ":lib/klayout/libklayout_laybasic.so.0",
)
cc_import_library(
    name = "libklayout_db.so.0",
    shared_library = ":lib/klayout/libklayout_db.so.0",
)
cc_import_library(
    name = "libklayout_lym.so.0",
    shared_library = ":lib/klayout/libklayout_lym.so.0",
)
cc_import_library(
    name = "libklayout_edt.so.0",
    shared_library = ":lib/klayout/libklayout_edt.so.0",
)
cc_import_library(
    name = "libklayout_ant.so.0",
    shared_library = ":lib/klayout/libklayout_ant.so.0",
)
cc_import_library(
    name = "libklayout_layview.so.0",
    shared_library = ":lib/klayout/libklayout_layview.so.0",
)
cc_import_library(
    name = "libklayout_layui.so.0",
    shared_library = ":lib/klayout/libklayout_layui.so.0",
)
cc_import_library(
    name = "libklayout_img.so.0",
    shared_library = ":lib/klayout/libklayout_img.so.0",
)
cc_import_library(
    name = "libklayout_lib.so.0",
    shared_library = ":lib/klayout/libklayout_lib.so.0",
)
cc_import_library(
    name = "libklayout_qtbasic.so.0",
    shared_library = ":lib/klayout/libklayout_qtbasic.so.0",
)
cc_import_library(
    name = "libklayout_QtCore.so.0",
    shared_library = ":lib/klayout/libklayout_QtCore.so.0",
)
cc_import_library(
    name = "libklayout_QtXml.so.0",
    shared_library = ":lib/klayout/libklayout_QtXml.so.0",
)
cc_import_library(
    name = "libklayout_QtNetwork.so.0",
    shared_library = ":lib/klayout/libklayout_QtNetwork.so.0",
)
cc_import_library(
    name = "libklayout_QtSql.so.0",
    shared_library = ":lib/klayout/libklayout_QtSql.so.0",
)
cc_import_library(
    name = "libklayout_QtDesigner.so.0",
    shared_library = ":lib/klayout/libklayout_QtDesigner.so.0",
)
cc_import_library(
    name = "libklayout_QtUiTools.so.0",
    shared_library = ":lib/klayout/libklayout_QtUiTools.so.0",
)
cc_import_library(
    name = "libklayout_QtWidgets.so.0",
    shared_library = ":lib/klayout/libklayout_QtWidgets.so.0",
)
cc_import_library(
    name = "libklayout_QtMultimedia.so.0",
    shared_library = ":lib/klayout/libklayout_QtMultimedia.so.0",
)
cc_import_library(
    name = "libklayout_QtPrintSupport.so.0",
    shared_library = ":lib/klayout/libklayout_QtPrintSupport.so.0",
)
cc_import_library(
    name = "libklayout_QtSvg.so.0",
    shared_library = ":lib/klayout/libklayout_QtSvg.so.0",
)
cc_import_library(
    name = "libklayout_QtXmlPatterns.so.0",
    shared_library = ":lib/klayout/libklayout_QtXmlPatterns.so.0",
)
cc_import_library(
    name = "libklayout_QtGui.so.0",
    shared_library = ":lib/klayout/libklayout_QtGui.so.0",
)
cc_import_library(
    name = "libklayout_rba.so.0",
    shared_library = ":lib/klayout/libklayout_rba.so.0",
)
cc_import_library(
    name = "libklayout_pya.so.0",
    shared_library = ":lib/klayout/libklayout_pya.so.0",
)
cc_import_library(
    name = "libklayout_drc.so.0",
    shared_library = ":lib/klayout/libklayout_drc.so.0",
)
cc_import_library(
    name = "libklayout_lvs.so.0",
    shared_library = ":lib/klayout/libklayout_lvs.so.0",
)
cc_import_library(
    name = "libklayout_doc.so.0",
    shared_library = ":lib/klayout/libklayout_doc.so.0",
)
cc_import_library(
    name = "libklayout_icons.so.0",
    shared_library = ":lib/klayout/libklayout_icons.so.0",
)
cc_import(
    name = "libklayout_tl",
    shared_library = ":libklayout_tl.so.0",
)
cc_import(
    name = "libklayout_rdb",
    shared_library = ":libklayout_rdb.so.0",
)
cc_import(
    name = "libklayout_lym",
    shared_library = ":libklayout_lym.so.0",
)
cc_import(
    name = "libklayout_edt",
    shared_library = ":libklayout_edt.so.0",
)
cc_import(
    name = "libklayout_layview",
    shared_library = ":libklayout_layview.so.0",
)
cc_import(
    name = "libklayout_layui",
    shared_library = ":libklayout_layui.so.0",
)
cc_import(
    name = "libklayout_gsi",
    shared_library = ":libklayout_gsi.so.0",
    deps = [
        ":libklayout_tl"
    ]
)
cc_import(
    name = "libklayout_laybasic",
    shared_library = ":libklayout_laybasic.so.0",
    deps = [
        ":libklayout_rdb"
    ],
)
cc_import(
    name = "libklayout_db",
    shared_library = ":libklayout_db.so.0",
    deps = [
        ":libklayout_tl",
        ":libklayout_gsi"
    ],
)
cc_import(
    name = "libklayout_ant",
    shared_library = ":libklayout_ant.so.0",
    deps = [
        ":libklayout_laybasic",
        ":libklayout_db",
        ":libklayout_layui",
    ],
)
cc_import(
    name = "libklayout_img",
    shared_library = ":libklayout_img.so.0",
    deps = [
        ":libklayout_layview",
    ]
)
cc_import(
    name = "libklayout_lib",
    shared_library = ":libklayout_lib.so.0",
)
cc_import(
    name = "libklayout_lay",
    shared_library = ":libklayout_lay.so.0",
    deps = [
        ":libklayout_tl",
        ":libklayout_gsi",
        ":libklayout_db",
        ":libklayout_rdb",
        ":libklayout_lym",
        ":libklayout_laybasic",
        ":libklayout_layview",
        ":libklayout_layui",
        ":libklayout_ant",
        ":libklayout_img",
        ":libklayout_edt",
        ":libklayout_QtGui",
        ":libklayout_QtCore",
        ":libklayout_QtXml",
        ":libklayout_QtWidgets",
        ":libklayout_rba",
        ":libklayout_pya",
    ]
)
cc_import(
    name = "libklayout_qtbasic",
    shared_library = ":libklayout_qtbasic.so.0",
)
cc_import(
    name = "libklayout_QtCore",
    shared_library = ":libklayout_QtCore.so.0",
    deps = [
        ":libklayout_qtbasic",
    ],
)
cc_import(
    name = "libklayout_rba",
    shared_library = ":libklayout_rba.so.0",
)
cc_import(
    name = "libklayout_pya",
    shared_library = ":libklayout_pya.so.0",
)
cc_import(
    name = "libklayout_drc",
    shared_library = ":libklayout_drc.so.0",
)
cc_import(
    name = "libklayout_lvs",
    shared_library = ":libklayout_lvs.so.0",
)
cc_import(
    name = "libklayout_doc",
    shared_library = ":libklayout_doc.so.0",
)
cc_import(
    name = "libklayout_icons",
    shared_library = ":libklayout_icons.so.0",
)
cc_import(
    name = "libklayout_QtGui",
    shared_library = ":libklayout_QtGui.so.0",
)
cc_import(
    name = "libklayout_QtXml",
    shared_library = ":libklayout_QtXml.so.0",
)
cc_import(
    name = "libklayout_QtNetwork",
    shared_library = ":libklayout_QtNetwork.so.0",
)
cc_import(
    name = "libklayout_QtSql",
    shared_library = ":libklayout_QtSql.so.0",
)
cc_import(
    name = "libklayout_QtDesigner",
    shared_library = ":libklayout_QtDesigner.so.0",
)
cc_import(
    name = "libklayout_QtUiTools",
    shared_library = ":libklayout_QtUiTools.so.0",
)
cc_import(
    name = "libklayout_QtWidgets",
    shared_library = ":libklayout_QtWidgets.so.0",
)
cc_import(
    name = "libklayout_QtMultimedia",
    shared_library = ":libklayout_QtMultimedia.so.0",
)
cc_import(
    name = "libklayout_QtPrintSupport",
    shared_library = ":libklayout_QtPrintSupport.so.0",
)
cc_import(
    name = "libklayout_QtSvg",
    shared_library = ":libklayout_QtSvg.so.0",
)
cc_import(
    name = "libklayout_QtXmlPatterns",
    shared_library = ":libklayout_QtXmlPatterns.so.0",
)
cc_import_binary(
    name = "klayout",
    data = [
        ":klayout_plugins",
    ],
    deps = [
        ":libklayout_tl",
        ":libklayout_gsi",
        ":libklayout_ant",
        ":libklayout_img",
        ":libklayout_lib",
        ":libklayout_lay",
        ":libklayout_QtCore",
        ":libklayout_rba",
        ":libklayout_pya",
        ":libklayout_drc",
        ":libklayout_lvs",
        ":libklayout_doc",
        ":libklayout_icons",
        ":libklayout_QtGui",
        ":libklayout_QtXml",
        ":libklayout_QtNetwork",
        ":libklayout_QtSql",
        ":libklayout_QtDesigner",
        ":libklayout_QtUiTools",
        ":libklayout_QtWidgets",
        ":libklayout_QtMultimedia",
        ":libklayout_QtPrintSupport",
        ":libklayout_QtSvg",
        ":libklayout_QtXmlPatterns",
    ],
    executable = ":lib/klayout/klayout",
    visibility = ["//visibility:public"],
)
