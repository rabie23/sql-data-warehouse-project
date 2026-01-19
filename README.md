
# Data Warehouse und Analytics-Projekt

Willkommen im Repository des **Data Warehouse und Analytics-Projekts**! 🚀  
Dieses Projekt demonstriert eine umfassende Data-Warehousing- und Analytics-Lösung, vom Aufbau eines Data Warehouse bis zur Generierung umsetzbarer Erkenntnisse. Es wurde als Portfolio-Projekt konzipiert und hebt die besten Praktiken der Branche im Bereich Data Engineering und Analytics hervor.

---
## 🏗️ Datenarchitektur

Die Datenarchitektur für dieses Projekt folgt den Ebenen **Bronze**, **Silber** und **Gold** der Medallion-Architektur:

1. **Bronze-Ebene**: Speichert Rohdaten unverändert aus den Quellsystemen. Die Daten werden aus CSV-Dateien in die SQL Server-Datenbank übernommen.
2. **Silber-Ebene**: Diese Ebene umfasst Datenbereinigungs-, Standardisierungs- und Normalisierungsprozesse, um die Daten für die Analyse vorzubereiten.
3. **Gold-Ebene**: Beherbergt geschäftsfertige Daten, die in einem für Berichte und Analysen erforderlichen Sternschema modelliert sind.

---
## 📖 Projektübersicht

Dieses Projekt umfasst:

1. **Datenarchitektur**: Entwurf eines modernen Data Warehouse unter Verwendung der Ebenen **Bronze**, **Silber** und **Gold** der Medallion-Architektur.
2. **ETL-Pipelines**: Extrahieren, Transformieren und Laden von Daten aus Quellsystemen in das Warehouse.
3. **Datenmodellierung**: Entwicklung von Fakten- und Dimensionstabellen, die für analytische Abfragen optimiert sind.
4. **Analytik und Berichterstellung**: Erstellung von SQL-basierten Berichten und Dashboards für umsetzbare Erkenntnisse.

🎯 Dieses Repository ist eine hervorragende Ressource für Fachleute und Studenten, die ihre Fachkenntnisse in folgenden Bereichen unter Beweis stellen möchten:
- SQL-Entwicklung
- Datenarchitektur
- Datenverarbeitung  
- ETL-Pipeline-Entwicklung  
- Datenmodellierung  
- Datenanalyse  

---
## 🚀 Projektanforderungen

### Aufbau des Data Warehouse (Data Engineering)

#### Ziel
Entwicklung eines modernen Data Warehouse unter Verwendung von SQL Server zur Konsolidierung von Verkaufsdaten, um analytische Berichte und fundierte Entscheidungen zu ermöglichen.

#### Spezifikationen
- **Datenquellen**: Importieren von Daten aus zwei Quellsystemen (ERP und CRM), die als CSV-Dateien bereitgestellt werden.
- **Datenqualität**: Bereinigung und Behebung von Datenqualitätsproblemen vor der Analyse.
- **Integration**: Zusammenführung beider Quellen zu einem einzigen, benutzerfreundlichen Datenmodell, das für analytische Abfragen ausgelegt ist.
- **Umfang**: Konzentration ausschließlich auf den aktuellen Datensatz; eine Historisierung der Daten ist nicht erforderlich.
- **Dokumentation**: Bereitstellung einer klaren Dokumentation des Datenmodells zur Unterstützung sowohl der Geschäftsinteressenten als auch der Analyseteams.

---

### BI: Analytik und Berichterstattung (Datenanalyse)

#### Ziel
Entwicklung einer SQL-basierten Analytik, um detaillierte Einblicke in folgende Bereiche zu gewinnen:
- **Kundenverhalten**
- **Produktleistung**
- **Verkaufstrends**

Diese Einblicke liefern den Stakeholdern wichtige Geschäftskennzahlen und ermöglichen so strategische Entscheidungen.

#### Zielsetzung
Entwicklung einer SQL-basierten Analyse, um detaillierte Einblicke in folgende Bereiche zu gewinnen:
- **Kundenverhalten**
- **Produktleistung**
- **Verkaufstrends**

Diese Einblicke liefern den Stakeholdern wichtige Geschäftskennzahlen und ermöglichen so strategische Entscheidungen.  

Weitere Informationen finden Sie unter [docs/requirements.md](docs/requirements.md).

## 📂 Repository-Struktur
```
data-warehouse-project/
│
├── datasets/                           # Für das Projekt verwendete Rohdatensätze (ERP- und CRM-Daten)
│
├── docs/                               # Projektdokumentation und Details zur Architektur
│   ├── etl.drawio                      # Draw.io-Datei zeigt alle verschiedenen Techniken und Methoden von ETL
│   ├── data_architecture.drawio        # Draw.io-Datei zeigt die Architektur des Projekts
│   ├── data_catalog.md                 # Katalog der Datensätze, einschließlich Feldbeschreibungen und Metadaten
│   ├── data_flow.drawio                # Draw.io-Datei für das Datenflussdiagramm
│   ├── data_models.drawio              # Draw.io-Datei für Datenmodelle (Sternschema)
│   ├── naming-conventions.md           # Einheitliche Namenskonventionen für Tabellen, Spalten und Dateien
│
├── scripts/                            # SQL-Skripte für ETL und Transformationen
│   ├── bronze/                         # Skripte zum Extrahieren und Laden von Rohdaten
│   ├── silver/                         # Skripte zum Bereinigen und Transformieren von Daten
│   ├── gold/                           # Skripte zum Erstellen von Analysemodellen
│
├── tests/                              # Testskripte und Qualitätsdateien
│
├── README.md                           # Projektübersicht und Anweisungen
├── LICENSE                             # Lizenzinformationen für das Repository
├── .gitignore                          # Von Git zu ignorierende Dateien und Verzeichnisse
└── requirements.txt                    # Abhängigkeiten und Anforderungen für das Projekt
```

## 🛡️ Lizenz

Dieses Projekt unterliegt der [MIT-Lizenz](LICENSE). Sie können dieses Projekt unter Angabe der entsprechenden Quelle frei verwenden, ändern und weitergeben.

## 🌟 Über mich
