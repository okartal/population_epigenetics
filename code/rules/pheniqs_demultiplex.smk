rule pheniqs_demultiplex:
    input:
        conf="data/{unit}_demux.config.json",
        cram="data/{unit}_inter.cram"
    output:
        cram="data/{unit}_demux.cram",
        json="data/{unit}_demux.report.json"
    threads:
        config["threads"]["pheniqs"]
    shell:
        "pheniqs mux -t {threads}"
        " --config {input.conf}"
        " --report {output.json}"
        " --output {output.cram}"