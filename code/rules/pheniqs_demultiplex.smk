rule pheniqs_demultiplex:
    input:
        conf="{unit}_demux_config.json",
        cram="{unit}_inter.cram"
    output:
        cram="{unit}_demux.cram",
        json="{unit}_demux_report.json"
    threads:
        config["threads"]["pheniqs"]
    params:
        "SORT_ORDER=queryname"
    shell:
        "pheniqs mux -t {threads}"
        " --config {input.conf}"
        " --report {output.json}"
        " | picard SortSam I=/dev/stdin O={output.cram} {params}"
        
