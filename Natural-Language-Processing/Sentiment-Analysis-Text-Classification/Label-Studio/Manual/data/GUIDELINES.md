# Sentiment Analysis Annotation Guidelines

These guidelines describe how to annotate text data for **sentiment classification**.
The goal is to assign one label to each text sample indicating its **overall emotional tone**:
**Positive**, **Negative**, or **Neutral**.

---

## 1. Sentiment Categories

| Label        | Meaning                                                                         | Example                                            |
| ------------ | ------------------------------------------------------------------------------- | -------------------------------------------------- |
| **Positive** | Expresses satisfaction, happiness, optimism, approval, or any favorable emotion | *“I love this product — it works perfectly!”*      |
| **Negative** | Expresses dissatisfaction, frustration, sadness, anger, or criticism            | *“This service is terrible and a waste of money.”* |
| **Neutral**  | Factual or emotionless statement; no clear positive or negative feeling         | *“The meeting starts at 10 a.m.”*                  |

> ⚠️ When unsure, choose **Neutral** rather than guessing.

---

## 2. Consistency Rules

* Follow **the same rule** for similar sentences.
* Revisit uncertain examples after labeling several samples.
* If multiple annotators are labeling, **discuss disagreements** and update the guideline.

---

## 3. Focus on Sentiment, Not Topic

Label only **how the author feels**, not **what** they’re talking about.

**Example:**

> “The camera takes great photos, but the battery dies fast.”
> ➡️ Mixed — mostly **Neutral** or **Negative** (depending on dominant tone).

---

## 4. Mixed or Ambiguous Sentiment

Some texts express both positive and negative emotions.

**Example:**

> “The hotel was clean, but the staff were rude.”

Options:

* Use **Neutral** or **Mixed** (if your scheme allows), or
* Choose the **dominant emotion** (the stronger one).

✅ **Be consistent** — apply the same rule to all similar cases.

---

## 5. Sarcasm and Irony

Be careful — sometimes the literal meaning differs from the emotional one.

**Example:**

> “Great, another app crash. Just what I needed!”
> ➡️ **Negative**

If sarcasm is too subtle or uncertain, mark it as **Neutral**.

---

## 6. Context and Domain Awareness

Some words change sentiment depending on context.

| Word    | Context                  | Label            |
| ------- | ------------------------ | ---------------- |
| *cheap* | “cheap and reliable”     | Positive         |
| *cheap* | “feels cheap and flimsy” | Negative         |
| *sick*  | “That trick was sick!”   | Positive (slang) |

Always consider **domain-specific meanings** and **slang**.

---

## 7. Level of Annotation

Be clear about what you are labeling:

* **Sentence-level** (default): one label per sentence
* **Document-level:** one label for the whole review or paragraph
* **Aspect-level:** label per feature (e.g., “food” vs. “service”)

⚠️ Don’t mix different levels in the same dataset.

---

## 8. Quality Control

After labeling:

* Randomly recheck 5–10% of the samples.
* Track **inconsistencies** and update this document if needed.
* If multiple annotators: compute **agreement metrics** (e.g., Cohen’s Kappa).

---

## 9. Avoid Bias

* Don’t let your **personal opinion** about the topic influence labels.
* Don’t assume something is positive just because you agree with it.
* Try not to let **recent samples** influence your next decision.

---

## 10. Documentation and Review

Keep a short record of:

* Difficult examples
* Any rule changes
* Common edge cases

This helps future annotators maintain the same quality and interpretation.

---

## 11. Sentiment Decision Tree (Flowchart)

Use this simple flow to decide the correct label quickly:

```
            ┌───────────────────────────┐
            │ Does the text express     │
            │ any emotion or opinion?   │
            └─────────────┬─────────────┘
                          │
                 ┌────────┴─────────┐
                 │                  │
               Yes                 No
                 │                  │
                 │            ┌──────────────────────────────┐
                 │            │ Label as NEUTRAL             │
                 │            │ (Factual / emotionless)      │
                 │            └──────────────────────────────┘
                 │
        ┌────────┴────────┐
        │                 │
  Positive emotion    Negative emotion
   (happy, proud,      (angry, sad,
   satisfied, etc.)    frustrated, etc.)
        │                 │
        │                 │
┌──────────────┐   ┌──────────────┐
│ Label as     │   │ Label as     │
│ POSITIVE     │   │ NEGATIVE     │
└──────────────┘   └──────────────┘
```

### Examples by Path

| Text                                  | Emotion Detected | Label                    |
| ------------------------------------- | ---------------- | ------------------------ |
| “I’m so happy with this result!”      | Positive emotion | Positive                 |
| “This app keeps crashing.”            | Negative emotion | Negative                 |
| “The report was submitted on time.”   | No emotion       | Neutral                  |
| “The product is great but expensive.” | Mixed tone       | Neutral or dominant tone |

---

## 12. Borderline and Tricky Cases

These are common **gray areas** where annotators often disagree.
Use the following guidance for consistency:

| Example                      | Explanation                                                              | Recommended Label                         |
| ---------------------------- | ------------------------------------------------------------------------ | ----------------------------------------- |
| “Not bad.”                   | Mild praise, implies satisfaction but not strong enthusiasm              | **Positive**                              |
| “Could be better.”           | Slight disappointment or room for improvement                            | **Negative**                              |
| “It’s okay.”                 | Neutral tone, neither strongly positive nor negative                     | **Neutral**                               |
| “Fine.”                      | Neutral or slightly positive depending on tone; assume no strong emotion | **Neutral**                               |
| “The design isn’t terrible.” | Negation of a negative, so mildly positive                               | **Positive**                              |
| “I expected more.”           | Expresses disappointment                                                 | **Negative**                              |
| “Nothing special.”           | Indicates neutrality or mild disappointment                              | **Neutral** or **Negative** (define rule) |
| “It works.”                  | Functional, but emotionless                                              | **Neutral**                               |
| “It just works flawlessly.”  | Adds praise or relief                                                    | **Positive**                              |
| “Meh.”                       | Disinterest or mild dissatisfaction                                      | **Negative**                              |
| “Not what I hoped for.”      | Expresses unmet expectations                                             | **Negative**                              |
| “Better than I thought.”     | Pleasant surprise                                                        | **Positive**                              |
| “I don’t hate it.”           | Weak positive (lack of dislike)                                          | **Neutral** or **Positive**               |
| “Honestly, it’s fine.”       | Neutral reassurance                                                      | **Neutral**                               |
| “I guess it’s okay.”         | Mild hesitation, neutral                                                 | **Neutral**                               |
| “It wasn’t great.”           | Understated criticism                                                    | **Negative**                              |

✅ **Tip:** When the tone is weak or uncertain, **default to Neutral**.
Avoid reading too much emotion into subtle phrases unless explicitly stated.

---

## Summary Table

| Rule                            | Description                                 |
| ------------------------------- | ------------------------------------------- |
| 1️⃣ Define categories clearly   | Positive, Negative, Neutral                 |
| 2️⃣ Stay consistent             | Use the same logic for all similar texts    |
| 3️⃣ Focus on sentiment          | Not topic or intent                         |
| 4️⃣ Handle mixed tone carefully | Use dominant or Neutral                     |
| 5️⃣ Detect sarcasm              | Literal ≠ real sentiment                    |
| 6️⃣ Consider context            | Same word may change polarity               |
| 7️⃣ Choose annotation level     | Sentence / Document / Aspect                |
| 8️⃣ Review for quality          | Random checks and inter-annotator agreement |
| 9️⃣ Avoid bias                  | Be objective                                |
| 🔟 Keep this guideline updated  | Document all decisions                      |

