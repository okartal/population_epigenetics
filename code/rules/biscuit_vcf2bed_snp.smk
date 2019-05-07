rule biscuit_vcf2bed_snp:
    input:
        vcf="{unit}/{readgroup}.vcf.gz"
    output:
        bed="{unit}/{readgroup}_snp.bed.gz"
    params:
        "-t snp"
    shell:
        "biscuit vcf2bed {params} {input.vcf}"
        " | bgzip > {output.bed}"

rule tabix_bed_snp:
    input:
        "{unit}/{readgroup}_snp.bed.gz"
    output:
        "{unit}/{readgroup}_snp.bed.gz.tbi"
    shell:
        "tabix -p bed {input}"
