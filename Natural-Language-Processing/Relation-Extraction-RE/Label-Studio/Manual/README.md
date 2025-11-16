# Relation Extraction (RE) Annotation

This subproject demonstrates **skills in Relation Extraction (RE) data annotation** using **[Label Studio](https://labelstud.io/)** with JSON exports, including **visualization**, **evaluation**, and **graph-based analysis** of labeled entities and relations.

> ⚙️ No model training is performed — this project focuses purely on the **manual annotation workflow**, **data quality**, and **visual insights** of extracted relations.

---

## 📁 Folder Structure

```plaintext
annotations/
└── train.json             # Labeled data exported from Label Studio (JSON format)

data/
├── GUIDELINES.md          # Annotation guidelines for labeling entities & relations
└── taxonomy_texts.csv     # Randomly generated text samples for RE annotation

notebooks/                  
└── re_annotations.ipynb   # Main notebook: visualize, evaluate & generate report

results/
├── annotations_stats.txt  # Entity & relation frequency counts
├── eval_summary.txt       # Annotation evaluation summary
├── report.md              # GitHub-ready summary report
├── entity_counts.png      # Entity count bar chart
├── relation_counts.png    # Relation count bar chart
└── relation_graph.png     # Network graph of entities & relations

README.md                   # (You are here)
```

---

## 📂 Data Folder

The `data/` folder contains source texts and annotation guidelines:

```plaintext
data/
├── GUIDELINES.md
└── taxonomy_texts.csv
```

> ⚠️ **Note:**
>
> * The text samples in `taxonomy_texts.csv` were **generated using ChatGPT** to simulate structured entity-relation scenarios.
> * 100 of these raw samples were imported into **Label Studio** and **annotated manually**.
> * `GUIDELINES.md` provides **instructions for annotators**, including entity types, relation types, labeling rules, and examples.

---

## Tools Used

| Component            | Purpose                                           |
| -------------------- | ------------------------------------------------- |
| **Label Studio**     | Manual RE annotation                              |
| **JSON Format**      | Structured export containing entities & relations |
| **Python + Jupyter** | Data processing, visualization, and reporting     |
| **Matplotlib**       | Bar plots for entity & relation counts            |
| **NetworkX**         | Graph visualization of entities and relations     |

---

## How to Run

1. **Navigate to the project folder**:

   ```bash
   cd <project-folder>
   ```

2. **Install dependencies**:

   ```bash
   pip install matplotlib networkx jupyter
   ```

3. **Open the notebook**:

   ```bash
   jupyter notebook notebooks/re_annotations.ipynb
   ```

4. **Run all cells**:

   * Reads `annotations/train.json` (exported from Label Studio)
   * Extracts entities and relations
   * Generates:

     * `results/annotations_stats.txt`
     * `results/eval_summary.txt`
     * `results/entity_counts.png`
     * `results/relation_counts.png`
     * `results/relation_graph.png`
     * `results/report.md`

---

## About the Annotations

Annotations were created in **Label Studio** using the RE interface:

* **Entities**: ORG, PER, DATE, CITY, STATE/PROVINCE, TITLE, LOC, COUNTRY, DATETIME, NUM, etc.
* **Relations**: org:founded_by, org:founded, per:city_of_birth, per:employee_of, per:title, no_relation, etc.
* Each relation connects **two entities** and specifies the type and direction of the relationship.

> **Annotation skill highlight:** 100 text samples were annotated manually, capturing **239 entities** and **152 relations**, demonstrating speed, accuracy, and familiarity with RE labeling workflows.

---

## Example: Entity & Relation Extraction

| Raw Text                                          | Extracted Entities & Relations                                                                                                                                  |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `"Apple was founded by Steve Jobs in Cupertino."` | **Entities:** Apple (ORG), Steve Jobs (PER), Cupertino (CITY)<br>**Relations:** org:founded_by(Apple → Steve Jobs), org:city_of_headquarters(Apple → Cupertino) |

---

## Example Evaluation Summary

**`results/eval_summary.txt`:**

```plaintext
num_annotation_tasks: 100
num_entities: 239
num_relations: 152
unique_entity_labels: ORG, PER, DATE, CITY, STATE/PROVINCE, TITLE, LOC, COUNTRY, DATETIME, None, NUM
unique_relation_labels: org:founded_by, org:founded, per:city_of_birth, per:stateorprovince_of_birth, ...
```

**`results/annotations_stats.txt`** provides detailed entity and relation counts.

---

## Visualizations

### Entity Counts

![Entity Counts](results/entity_counts.png)

### Relation Counts

![Relation Counts](results/relation_counts.png)

### Relation Graph

![Relation Graph](results/relation_graph.png)

> **Graph Description:** Nodes represent entities (colored by type), edges represent relations, and arrows indicate relation direction.

---

## Generated Report

`results/report.md` contains:

* Dataset summary
* Entity & relation counts
* Graph visualization
* All figures and statistics ready for GitHub reporting

---

## Technologies Used

* **Python 3.9+**
* **Label Studio** — for manual RE annotation
* **Matplotlib + NetworkX** — for visualization
* **Jupyter Notebook** — for analysis and report generation

---

## Author

**Karan Heera**
🌐 [GitHub](https://github.com/karanheera/) • [LinkedIn](https://linkedin.com/in/karanheera/)

---

## 🏁 Summary

This Relation Extraction Annotation project demonstrates:

* Practical **RE dataset creation** with **Label Studio**
* Ability to **analyze and visualize entities and relations** using Python, Matplotlib, and NetworkX
* **Automated evaluation and reporting** for annotation quality
* **Efficient manual annotation workflow** and **structured JSON export handling**
* **Visual summary of entity-relation interactions** for documentation and validation
* Use of **ChatGPT-generated text samples** to simulate realistic relation scenarios

