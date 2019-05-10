rule biscuit_pileup:
    input:
        ref=config["data"]["reference_genome"],
        bam="{unit}/{readgroup}_mapped.bam",
        bai="{unit}/{readgroup}_mapped.bam.bai"
    output:
        vcf="{unit}/{readgroup}.vcf.gz"
    threads:
        config["threads"]["biscuit_pileup"]
    shell:
        "biscuit pileup -q {threads} {input.ref} {input.bam}"
        " | bgzip > {output.vcf}"

rule tabix_vcf:
    input:
        "{unit}/{readgroup}.vcf.gz"
    output:
        "{unit}/{readgroup}.vcf.gz.tbi"
    shell:
        "tabix -p vcf {input}"
