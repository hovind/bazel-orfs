load("//:openroad.bzl", "build_openroad", "synth")

build_openroad(
    name = "tag_array_64x184",
    io_constraints = "//:io-sram",
    abstract_stage = "floorplan",
    sdc_constraints = "//:constraints-sram",
    stage_args = {
        "floorplan": [
            "CORE_UTILIZATION=40",
            "CORE_ASPECT_RATIO=2",
        ],
        "place": ["PLACE_DENSITY=0.65"],
    },
    verilog_files = ["rtl/tag_array_64x184.sv"],
)

synth(
    name = "test_synth",
    module_top = "tag_array_64x184",
    arguments = {
        "SDC_FILE": "$(location //:constraints-sram)",
    },
    data = [
        "//:constraints-sram",
    ],
    verilog_files = [":rtl/tag_array_64x184.sv"],
)
