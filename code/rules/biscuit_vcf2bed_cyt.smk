rule biscuit_vcf2bed_cyt:
    input:
        vcf="{unit}/{readgroup}.vcf.gz"
    output:
        bed="{unit}/{readgroup}_cyt.bed.gz"
    params:
        "-t c -e"
    shell:
        "biscuit vcf2bed {params} {input.vcf}"
        " | bgzip > {output.bed}"

rule tabix_bed_cyt:
    input:
        "{unit}/{readgroup}_cyt.bed.gz"
    output:
        "{unit}/{readgroup}_cyt.bed.gz.tbi"
    shell:
        "tabix -p bed {input}"
