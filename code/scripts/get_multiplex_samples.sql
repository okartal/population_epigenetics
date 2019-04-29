SELECT 'lineage-' || lineage AS [unit-id],
       'L' || lineage || '_F' || seedmix.generation || '_P' || id_Plant || '_S' || id_PlantSample || '-' || abbreviation AS SM,
       date || '_R' || run_number || '_D' || id_DNA AS LB,
       index_sequence AS barcode
  FROM Link_Library_KingfisherRun,
       KingfisherRun,
       Library,
       IlluminaAdapter,
       DNAFragmented,
       DNA,
       PlantSample,
       PlantStructure,
       Plant,
       PlantLocation,
       CultureLocation,
       CultureCode,
       Culture,
       (select id from SeedBag) seedbag,
       (
           SELECT DISTINCT Link_SeedBag.id_SeedBag_mix AS id,
                           SeedBag.generation
             FROM Link_SeedBag,
                  SeedBag
            WHERE SeedBag.id == Link_SeedBag.id_SeedBag_parent
       )
       seedmix
 WHERE Link_Library_KingfisherRun.id_KingfisherRun == KingfisherRun.id AND 
       Library.id == Link_Library_KingfisherRun.id_Library AND 
       Link_Library_KingfisherRun.id_KingfisherRun BETWEEN 3 AND 10 AND 
       Library.id_IlluminaAdapter == IlluminaAdapter.id AND 
       Library.id_DNAFragmented == DNAFragmented.id AND 
       DNAFragmented.id_DNA == DNA.id AND 
       DNA.id_PlantSample == PlantSample.id AND 
       PlantSample.id_Plant == Plant.id AND 
       PlantSample.id_PlantStructure == PlantStructure.id AND 
       Plant.id_PlantLocation == PlantLocation.id AND 
       PlantLocation.id_CultureLocation == CultureLocation.id AND 
       CultureLocation.id_CultureCode == CultureCode.id AND 
       CultureCode.id_Culture == Culture.id AND 
       Culture.id_SeedBag == seedbag.id AND 
       seedbag.id == seedmix.id
