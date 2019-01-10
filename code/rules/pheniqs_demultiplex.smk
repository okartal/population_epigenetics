rule pheniqs_demultiplex:
    input:
        conf="{unit}_demux_config.json",
        cram=config["data"]["dir"] + "{unit}_inter.cram"
    output:
        cram="{unit}_demux.cram",
        json="{unit}_demux_report.json"
    threads:
        config["threads"]["pheniqs"]
    shell:
        "pheniqs mux -t {threads}"
        " --config {input.conf}"
        " --report {output.json}"
        " --output {output.cram}"