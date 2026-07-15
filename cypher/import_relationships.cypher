// =========================
// ThreatGroup -> Malware (USES)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'USES'
MATCH (tg:ThreatGroup {id: row.from})
MATCH (m:Malware {id: row.to})
MERGE (tg)-[:USES]->(m);

// =========================
// ThreatGroup -> Technique (EMPLOYS)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'EMPLOYS'
MATCH (tg:ThreatGroup {id: row.from})
MATCH (t:Technique {id: row.to})
MERGE (tg)-[:EMPLOYS]->(t);

// =========================
// ThreatGroup -> Industry (TARGETS)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'TARGETS'
MATCH (tg:ThreatGroup {id: row.from})
MATCH (i:Industry {id: row.to})
MERGE (tg)-[:TARGETS]->(i);

// =========================
// ThreatGroup -> Country (LOCATED_IN)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'LOCATED_IN'
MATCH (tg:ThreatGroup {id: row.from})
MATCH (c:Country {name: row.to})
MERGE (tg)-[:LOCATED_IN]->(c);

// =========================
// Malware -> CVE (EXPLOITS)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'EXPLOITS'
MATCH (m:Malware {id: row.from})
MATCH (c:CVE {id: row.to})
MERGE (m)-[:EXPLOITS]->(c);

// =========================
// CVE -> Product (AFFECTS)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'AFFECTS'
MATCH (c:CVE {id: row.from})
MATCH (p:Product {id: row.to})
MERGE (c)-[:AFFECTS]->(p);

// =========================
// Product -> Vendor (PRODUCED_BY)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'PRODUCED_BY'
MATCH (p:Product {id: row.from})
MATCH (v:Vendor {id: row.to})
MERGE (p)-[:PRODUCED_BY]->(v);

// =========================
// Patch -> CVE (FIXED_BY)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'FIXED_BY'
MATCH (patch:Patch {id: row.from})
MATCH (c:CVE {id: row.to})
MERGE (patch)-[:FIXED_BY]->(c);

// =========================
// Patch -> Product (PROTECTS)
// =========================
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row
WITH row WHERE row.type = 'PROTECTS'
MATCH (patch:Patch {id: row.from})
MATCH (p:Product {id: row.to})
MERGE (patch)-[:PROTECTS]->(p);