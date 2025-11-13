# Named Entity Recognition (NER) Annotation Guidelines

These guidelines define how to annotate text data for **Named Entity Recognition (NER)** using **BIO tagging** in **Label Studio**.

---

## 1. Setup Notes for Label Studio

Before annotating:

* Make sure your **Label Configuration** includes all entity tags:
  `ORG, PERSON, LOC, DATE, TIME, PRODUCT, EVENT, URL, HASHTAG`
* Label Studio automatically handles **B-** and **I-** tagging behind the scenes when you select token spans — you just select the text span and choose the entity type.
* You do **not** need to type the tags manually.
* Always ensure spans are **precise** — no extra spaces or punctuation.

---

## 2. Entity Definitions

| Entity      | Definition                                       | Example                                                                               |
| ----------- | ------------------------------------------------ | ------------------------------------------------------------------------------------- |
| **ORG**     | Organizations, companies, institutions, agencies | *Google*, *United Nations*                                                            |
| **PERSON**  | Individual people (real or fictional)            | *Elon Musk*, *Harry Potter*                                                           |
| **LOC**     | Physical locations or geographic names           | *New York City*, *Amazon River*                                                       |
| **DATE**    | Dates and relative date expressions              | *September 12, 2023*, *next Monday*                                                   |
| **TIME**    | Specific times or durations                      | *3:30 PM*, *two hours*                                                                |
| **PRODUCT** | Products, services, or brands                    | *iPhone 15*, *Tesla Model 3*                                                          |
| **EVENT**   | Named events or occurrences                      | *World Cup 2022*, *Black Friday*                                                      |
| **URL**     | Web links and website names                      | *[https://openai.com](https://openai.com)*, *[www.github.com](http://www.github.com)* |
| **HASHTAG** | Social media hashtags                            | *#AIConference*, *#ThrowbackThursday*                                                 |

---

## 3. Entity Decision Flowchart

Use this step-by-step logic before labeling an entity.
This flow helps ensure **consistent classification** across annotators.

```
                     ┌────────────────────────────┐
                     │ Is it a named entity?       │
                     │ (proper name, title, brand) │
                     └──────────────┬──────────────┘
                                    │
                          ┌─────────┴─────────┐
                          │                   │
                        Yes                  No
                          │                   │
                          │              ┌───────────────┐
                          │              │ Label as 'O'  │
                          │              │ (non-entity)  │
                          │              └───────────────┘
                          │
              ┌───────────┴────────────────────────────────────┐
              │                                                │
        ┌─────┴─────┐                                   ┌──────┴──────┐
        │ Person?    │                                   │ Location?   │
        └─────┬──────┘                                   └──────┬──────┘
              │                                                      │
        ┌─────┴─────┐                                        ┌──────┴──────┐
        │ B/I-PERSON │                                        │ B/I-LOC     │
        └─────┬──────┘                                        └──────┬──────┘
              │                                                      │
       ┌──────┴─────────────────────────────────────────────────────────────┐
       │ Other possibilities →                                              │
       │                                                                    │
┌──────┴──────┐ ┌──────┬──────┐ ┌──────┬──────┐ ┌──────┬──────┐ ┌──────┬──────┐
│ Organization│ │ Product│     │ │ Event │     │ │ Date/ │ Time│ │ URL  │ Hash│
│ B/I-ORG     │ │ B/I-PRODUCT │ │ B/I-EVENT  │ │ B/I-DATE│TIME│ │ B/I-URL│TAG │
└─────────────┘ └──────────────┘ └────────────┘ └────────────┘ └─────────┘
```

---

## 4. Labeling Rules in Label Studio

### Selecting Entities

* Highlight only the **exact text span** belonging to the entity.
* Don’t include surrounding punctuation, determiners (“the”, “a”), or spaces.

**Example:**
✅ *Apple Inc.* → highlight exactly “Apple Inc.”
❌ Don’t highlight “the Apple Inc.”

---

### Overlapping Entities

Label Studio does **not support overlapping entities**, so select the **most specific one**.

**Example:**

> “New York University”
> ✅ Tag as **ORG** (not LOC + ORG).

---

### Multi-Token Entities

If an entity covers multiple words, highlight the **entire phrase**.

**Examples:**

* *World Health Organization* → `B-ORG I-ORG I-ORG`
* *Los Angeles Lakers* → `B-ORG I-ORG I-ORG`
* *Black Friday Sale* → `B-EVENT I-EVENT I-EVENT`

---

### URLs & Hashtags

* Include the entire URL in one span.
* Include the `#` in hashtags.

**Examples:**

```
https://openai.com → B-URL I-URL
#AIConference → B-HASHTAG
```

---

### Dates & Times

Label entire expressions, including prepositions if they are part of the phrase.

**Examples:**

* *on September 12, 2023* → `B-DATE I-DATE I-DATE`
* *at 3:30 PM* → `B-TIME I-TIME`
* *next Friday* → `B-DATE I-DATE`

---

### Products

Include brand + product name as one entity.

**Examples:**

* *Apple iPhone 15* → `B-PRODUCT I-PRODUCT I-PRODUCT`
* *PlayStation 5 Controller* → `B-PRODUCT I-PRODUCT I-PRODUCT`

---

### Events

Tag full names of named events or occurrences.

**Examples:**

* *Olympic Games* → `B-EVENT I-EVENT`
* *World Cup 2022* → `B-EVENT I-EVENT I-EVENT`

---

## 5. Common Edge Cases

| Case                                         | Explanation                 | Label         |
| -------------------------------------------- | --------------------------- | ------------- |
| *Amazon* (company)                           | Business context            | ORG           |
| *Amazon River*                               | Geographic feature          | LOC           |
| *Washington* (city)                          | Place name                  | LOC           |
| *Washington* (refers to U.S. government)     | Organization (metonymy)     | ORG           |
| *Monday morning*                             | DATE + TIME split if clear  | B-DATE I-TIME |
| *Dr. Jane Goodall*                           | Only person name            | PERSON        |
| *next year*                                  | Relative date               | DATE          |
| *Google Search*                              | Product                     | PRODUCT       |
| *Facebook post*                              | Only company name is entity | ORG           |
| *#WorldCup2022*                              | Hashtag of event            | HASHTAG       |
| *[https://twitter.com](https://twitter.com)* | URL                         | URL           |

---

## 6. Quality Control

When reviewing or exporting annotations from Label Studio:

* Ensure **no overlapping spans**.
* Verify every multi-word entity uses continuous spans.
* Reconfirm correct label type before finalizing.
* Run periodic **inter-annotator checks** for consistency.

---

## 7. Annotation Checklist

Before saving your task in Label Studio:

* [ ] Correct label chosen for each entity type
* [ ] Spans are precise (no punctuation or spaces)
* [ ] No overlaps or nested entities
* [ ] Multi-word entities fully included
* [ ] Ambiguous or unclear cases flagged in comments
* [ ] Checked your work before moving to next sample

---

## 8. Example Annotation (Label Studio Style)

| Sentence                                                            | Annotated Span     | Entity  |
| ------------------------------------------------------------------- | ------------------ | ------- |
| *Apple released the iPhone 15 in California on September 12, 2023.* | Apple              | ORG     |
|                                                                     | iPhone 15          | PRODUCT |
|                                                                     | California         | LOC     |
|                                                                     | September 12, 2023 | DATE    |

