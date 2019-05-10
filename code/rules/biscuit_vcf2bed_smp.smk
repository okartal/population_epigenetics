rule biscuit_vcf2bed_smp:
    input:
        vcf="{unit}/{readgroup}.vcf.gz"
    output:
        bed="{unit}/{readgroup}_smp.bed.gz"
    params:
        "-t c -e"
    shell:
        "biscuit vcf2bed {params} {input.vcf}"
        " | bgzip > {output.bed}"

rule tabix_bed_smp:
    input:
        "{unit}/{readgroup}_smp.bed.gz"
    output:
        "{unit}/{readgroup}_smp.bed.gz.tbi"
    shell:
        "tabix -p bed {input}"
