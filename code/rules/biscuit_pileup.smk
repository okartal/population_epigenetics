rule biscuit_pileup:
    input:
    output:
    threads:
    shell:
        "biscuit pileup -q {threads} {input.ref} {input.cram}"
        " | bgzip > {output.vcf}"

rule tabix_pileup:
    input:
    output:
    shell:
        "tabix -p vcf {input}"

rule biscuit_vcf2bed:
    input:
    output:
    params:
        config["params"]["biscuit_vcf2bed"] -t c -k 5 -e
    shell:
        "biscuit vcf2bed {params} {input} > {output}"

rule biscuit_mergecg:
    input:
    output:
    shell:
        "biscuit mergecg {input.ref} {input.bed} > {output}"