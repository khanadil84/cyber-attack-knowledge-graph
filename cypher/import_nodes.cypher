// =========================
// Import Countries
// =========================
LOAD CSV WITH HEADERS FROM 'file:///countries.csv' AS row
MERGE (:Country {name: row.name});

// =========================
// Import Threat Groups
// =========================
LOAD CSV WITH HEADERS FROM 'file:///threat_groups.csv' AS row
MERGE (:ThreatGroup {
    id: row.id,
    name: row.name,
    description: row.description,
    country: row.country
});

// =========================
// Import Malware
// =========================
LOAD CSV WITH HEADERS FROM 'file:///malware.csv' AS row
MERGE (:Malware {
    id: row.id,
    name: row.name,
    type: row.type
});

// =========================
// Import Techniques
// =========================
LOAD CSV WITH HEADERS FROM 'file:///techniques.csv' AS row
MERGE (:Technique {
    id: row.id,
    name: row.name
});

// =========================
// Import CVEs
// =========================
LOAD CSV WITH HEADERS FROM 'file:///cves.csv' AS row
MERGE (:CVE {
    id: row.id,
    cvss: toFloat(row.cvss),
    severity: row.severity
});

// =========================
// Import Products
// =========================
LOAD CSV WITH HEADERS FROM 'file:///products.csv' AS row
MERGE (:Product {
    id: row.id,
    name: row.name,
    version: row.version
});

// =========================
// Import Vendors
// =========================
LOAD CSV WITH HEADERS FROM 'file:///vendors.csv' AS row
MERGE (:Vendor {
    id: row.id,
    name: row.name
});

// =========================
// Import Patches
// =========================
LOAD CSV WITH HEADERS FROM 'file:///patches.csv' AS row
MERGE (:Patch {
    id: row.id,
    name: row.name,
    releaseDate: date(row.releaseDate)
});

// =========================
// Import Industries
// =========================
LOAD CSV WITH HEADERS FROM 'file:///industries.csv' AS row
MERGE (:Industry {
    id: row.id,
    name: row.name
});