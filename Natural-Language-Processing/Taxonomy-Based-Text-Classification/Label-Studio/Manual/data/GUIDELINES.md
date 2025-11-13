# Taxonomy Annotation Guidelines

These guidelines describe how to annotate text data for **taxonomy-based text classification**.
The goal is to assign the **most appropriate hierarchical label** (e.g., *Technology → AI*) to each text sample based on its **main topic or subject matter**.

---

## 1. Purpose of Taxonomy Annotation

Taxonomy annotation classifies each text sample into **predefined categories and subcategories** that represent a structured hierarchy of topics.

**Hierarchy used in this project:**

| Level 1           | Level 2                           |
| ----------------- | --------------------------------- |
| **Technology**    | AI, Gadgets, Software             |
| **Health**        | Fitness, Nutrition, Mental Health |
| **Sports**        | Football, Basketball, Tennis      |
| **Entertainment** | Movies, Music, TV Shows           |

Each text should be assigned **one (or more)** of these categories, depending on whether multi-labeling is allowed.

---

## 2. General Rules

* Assign **the most specific label** possible (e.g., `Technology → AI`, not just `Technology`).
* If a text could belong to multiple subcategories, label all relevant ones **only if multi-labeling is enabled**.
* If the text doesn’t clearly fit any category, mark it as **Unclear** or **Needs Review**.
* Stay consistent — similar texts should receive the same label(s).

---

## 3. Label Definitions and Examples

| Level 1 → Level 2            | Description                                                        | Example Text                                      |
| ---------------------------- | ------------------------------------------------------------------ | ------------------------------------------------- |
| **Technology → AI**          | Artificial intelligence, machine learning, automation, algorithms. | “AI is transforming how companies process data.”  |
| **Technology → Gadgets**     | Physical devices, electronics, consumer tech.                      | “The new smartwatch features a health tracker.”   |
| **Technology → Software**    | Apps, systems, updates, cybersecurity.                             | “Developers released a patch to fix a bug.”       |
| **Health → Fitness**         | Exercise, workouts, physical training.                             | “Running and yoga improve overall fitness.”       |
| **Health → Nutrition**       | Diet, food, vitamins, healthy eating.                              | “A balanced diet improves immune health.”         |
| **Health → Mental Health**   | Psychology, stress, therapy, mindfulness.                          | “Meditation reduces anxiety and boosts focus.”    |
| **Sports → Football**        | Football (soccer/American), teams, matches.                        | “The football team secured a late victory.”       |
| **Sports → Basketball**      | Games, players, tournaments, leagues.                              | “The basketball player scored 40 points.”         |
| **Sports → Tennis**          | Tournaments, matches, athletes.                                    | “The tennis star won her third Grand Slam title.” |
| **Entertainment → Movies**   | Films, directors, cinema, reviews.                                 | “The new sci-fi movie broke box office records.”  |
| **Entertainment → Music**    | Songs, artists, albums, concerts.                                  | “The artist released a hit new single.”           |
| **Entertainment → TV Shows** | Television, streaming series, episodes.                            | “The new TV show gained global popularity.”       |

---

## 4. Multi-Label Cases

If a text clearly covers multiple subtopics, label all relevant ones.

**Example:**

> “A fitness app uses AI to create personalized workout plans.”

✅ Labels: `Technology → AI`, `Health → Fitness`

Choose **multi-labeling** only if both are central.
If one topic dominates, label only that one.

---

## 5. Unclear or Out-of-Scope Texts

If the text does not fit any defined category:

* Label it as **Unclear** or **Needs Review** (if available).
* Don’t force-fit it into an unrelated label.

**Examples:**

* “The weather was great this weekend.” → Unclear
* “The stock market fluctuated sharply today.” → Unclear

---

## 6. Consistency Rules

* Always follow the **same logic** for similar topics.
* Review a few previous annotations if you’re unsure.
* Discuss difficult examples with teammates.
* Update the guideline if recurring issues appear.

---

## 7. Choosing the Correct Label

Ask yourself:

1. **What is the main topic?**
   → Determines the Level 1 category (Technology, Health, Sports, or Entertainment).
2. **What specific aspect of that topic is discussed?**
   → Determines the Level 2 subcategory (e.g., AI, Nutrition, Movies).

---

### **Decision Flow**

```
            ┌─────────────────────────────┐
            │ What is the main subject?   │
            └─────────────┬───────────────┘
                          │
     ┌────────────┬────────────┬────────────┬────────────┐
     │Technology  │   Health   │   Sports   │Entertainment│
     └────┬───────┴──────┬────┴──────┬─────┴──────┬──────┘
          │               │           │            │
   ┌──────┴─────┐   ┌─────┴────┐  ┌──┴───┐   ┌────┴────┐
   │ AI /       │   │ Fitness  │  │Football│   │ Movies  │
   │ Gadgets /  │   │ Nutrition│  │Basketball│ │ Music / │
   │ Software   │   │ Mental H.│  │Tennis│   │ TV Shows │
   └────────────┘   └──────────┘  └───────┘   └──────────┘
```

---

## 8. Ambiguous or Mixed Topics

| Case                               | Example                                         | Rule                                                              |
| ---------------------------------- | ----------------------------------------------- | ----------------------------------------------------------------- |
| **Two topics, same Level 1**       | “AI and software tools are improving workflow.” | Choose dominant subtopic (`Technology → AI`)                      |
| **Two topics, different Level 1s** | “Athletes use nutrition apps to plan meals.”    | Assign both (`Sports → Fitness`, `Health → Nutrition`) if allowed |
| **Unclear or unrelated**           | “The city’s population is growing.”             | Mark as **Unclear**                                               |

---

## 9. Quality Control

* Recheck a small portion (5–10%) after finishing.
* Keep a list of **tricky examples** and decisions.
* Ensure different annotators are consistent.
* Use agreement metrics if multiple people label the same data.

---

## 10. Avoid Bias and Topic Drift

* Focus on **what is written**, not assumptions.
* Do not infer implied topics.
* Avoid letting personal interests influence the decision.
* Don’t let previous labels bias your next one.

---

## 11. Documentation and Updates

Keep a **shared record** of:

* Difficult or ambiguous samples
* Clarifications or rule changes
* Overlaps between categories
* New topics that may need taxonomy updates

---

## 12. Example Annotations

| Text                                           | Correct Label(s)           | Reason                                 |
| ---------------------------------------------- | -------------------------- | -------------------------------------- |
| “AI helps doctors detect cancer early.”        | `Technology → AI`          | Focus on AI technology.                |
| “The smartwatch tracks steps and heart rate.”  | `Technology → Gadgets`     | Refers to a physical device.           |
| “A balanced diet improves overall wellness.”   | `Health → Nutrition`       | Focuses on food and diet.              |
| “The football league announced new rules.”     | `Sports → Football`        | Sports context, specifically football. |
| “The TV series finale shocked fans worldwide.” | `Entertainment → TV Shows` | Clearly about a television series.     |

---

## Annotator Checklist (Quick Reference)

Before submitting each annotation, confirm:

1. **Main Topic Identified**
   → Which top-level category best fits (Technology, Health, Sports, or Entertainment)?

2. **Specific Subtopic Chosen**
   → Which subcategory (AI, Fitness, Movies, etc.) is the best match?

3. **No Over-Interpretation**
   → Did you label only what the text *explicitly* discusses?

4. **Multi-Label Decision (if allowed)**
   → Did you include all relevant subtopics—but only if both are clearly central?

5. **Consistency Check**
   → Would another annotator likely make the same choice? If not, add it to the “tricky cases” list.



## Unclear Examples Reference Table

Use this table to guide how to handle **out-of-scope or ambiguous** samples.
If the text doesn’t clearly belong to any category below, label it as **Unclear** or **Needs Review**.

| Example Text                                             | Why It’s Unclear                         | What to Do           |
| -------------------------------------------------------- | ---------------------------------------- | -------------------- |
| “The weather was perfect for a picnic.”                  | General statement, no relevant category. | Mark as **Unclear**. |
| “The government announced new economic policies.”        | Politics/economy not in taxonomy.        | Mark as **Unclear**. |
| “She loves painting landscapes in her free time.”        | Art not included in hierarchy.           | **Unclear**.         |
| “The company’s CEO resigned after poor performance.”     | Business management topic, not covered.  | **Unclear**.         |
| “Global warming continues to threaten polar ecosystems.” | Environmental issue, outside taxonomy.   | **Unclear**.         |
| “The book explores ancient civilizations.”               | Literature/history not in taxonomy.      | **Unclear**.         |
| “Citizens are voting in the national election.”          | Politics, not defined category.          | **Unclear**.         |
| “The city’s transport system was upgraded.”              | Infrastructure topic, not covered.       | **Unclear**.         |
| “A new art exhibition opened downtown.”                  | Art/culture content, not included.       | **Unclear**.         |
| “The company reported record profits this quarter.”      | Economics/business, not in taxonomy.     | **Unclear**.         |

Rule of Thumb:
If the text cannot reasonably fit under *Technology, Health, Sports,* or *Entertainment*, or does not explicitly reference any of their subtopics → **Mark as Unclear**.


## Goal

Produce a **clean, structured, and consistent dataset** that classifies each text according to the defined taxonomy —
enabling reliable machine learning training and topic-based analytics.


