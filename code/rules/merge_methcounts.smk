rule merge_methcounts:
    input:
        expand("{readgroup_prefix}_{{context}}.meth",
               readgroup_prefix=readgroups.prefix.values,
               context=CONTEXT)
    output:
        "proportion_table_{context}.txt"
    shell:
        "merge-methcounts -t {input} > {output}"
