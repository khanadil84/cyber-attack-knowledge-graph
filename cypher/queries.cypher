// =====================================
// Graph Statistics
// =====================================
MATCH (n)
RETURN labels(n) AS Label, count(*) AS Count
ORDER BY Label;

// =====================================
// Total Relationships
// =====================================
MATCH ()-[r]->()
RETURN type(r) AS RelationshipType, count(r) AS Count
ORDER BY RelationshipType;

// =====================================
// Threat Groups and Malware
// =====================================
MATCH (tg:ThreatGroup)-[:USES]->(m:Malware)
RETURN tg.name AS ThreatGroup, m.name AS Malware;

// =====================================
// Threat Groups and Techniques
// =====================================
MATCH (tg:ThreatGroup)-[:EMPLOYS]->(t:Technique)
RETURN tg.name AS ThreatGroup, t.name AS Technique;

// =====================================
// Threat Groups Targeting Industries
// =====================================
MATCH (tg:ThreatGroup)-[:TARGETS]->(i:Industry)
RETURN tg.name AS ThreatGroup, i.name AS Industry;

// =====================================
// Malware Exploiting CVEs
// =====================================
MATCH (m:Malware)-[:EXPLOITS]->(c:CVE)
RETURN m.name AS Malware, c.id AS CVE;

// =====================================
// CVEs Affecting Products
// =====================================
MATCH (c:CVE)-[:AFFECTS]->(p:Product)
RETURN c.id AS CVE, p.name AS Product;

// =====================================
// Products and Vendors
// =====================================
MATCH (p:Product)-[:PRODUCED_BY]->(v:Vendor)
RETURN p.name AS Product, v.name AS Vendor;

// =====================================
// Patches Protecting Products
// =====================================
MATCH (patch:Patch)-[:PROTECTS]->(p:Product)
RETURN patch.name AS Patch, p.name AS Product;

// =====================================
// Complete Attack Chain
// =====================================
MATCH (tg:ThreatGroup)-[:USES]->(m:Malware)
      -[:EXPLOITS]->(c:CVE)
      -[:AFFECTS]->(p:Product)
RETURN tg, m, c, p;