# Semantic Segmentation Annotation Guidelines (Polygon-Based)

These guidelines describe how to annotate images for **semantic segmentation** using **polygon shapes**.
The goal is to draw **accurate polygons** around regions that belong to predefined **semantic classes** (e.g., Sky, Road, Building, Vegetation, etc.).

Each pixel in the image should belong to **exactly one class**, based purely on **visual appearance**, not assumptions or inference.

---

# 1. Semantic Segmentation Categories

Each annotated region must be assigned one of the predefined classes.
Below is the general meaning of semantic classes (adapt for your dataset):

| Category Example | Meaning / What to Include        | What **Not** to Include                           |
| ---------------- | -------------------------------- | ------------------------------------------------- |
| **Sky**          | Visible sky region               | Clouds (separate class), reflections of sky       |
| **Road**         | Asphalt or paved driving surface | Sidewalks, grass patches beside road              |
| **Building**     | Exterior surfaces of structures  | Cars, windows as transparent reflections          |
| **Vegetation**   | Trees, bushes, plants, grass     | Artificial plants, wooden furniture               |
| **Water**        | Lakes, rivers, ocean, ponds      | Reflections, wet ground                           |
| **Person**       | Human body outline               | Clothes lying on ground                           |
| **Car**          | Entire visible vehicle outline   | Detached car parts (separate category if defined) |

> ✔️ Always use the **exact name** and ID in your category list.
> ✔️ You may include a `Background` category if required.

---

# 2. Polygon Drawing Rules

These rules ensure accurate and consistent shapes.

### 2.1 Cover the Entire Object Region

* Draw polygons that follow **the true outline** of the object.
* Avoid leaving gaps.
* Polygons should be **tight** but not overly complex.

### 2.2 Use Multiple Polygons if Needed

* For disconnected parts of a single object category, draw **separate polygons**.
* Example: Two separate patches of grass → 2 polygons, same label.

### 2.3 Do Not Cross or Overlap Polygons of Different Classes

* Polygons must not overlap unless the tool handles region priority automatically.

### 2.4 Polygons Must Be in Clockwise or Counter-Clockwise Order

* Consistency matters for downstream systems.
* CVAT draws them automatically in order; do not reorder manually.

### 2.5 Minimum Polygon Quality

* At least **3 points** (triangle).
* Use more points for curved or complex shapes.
* Avoid unnecessary nodes that add noise.

---

# 3. Class Selection Rules

Annotate based on **what you clearly see**, not what you guess.

### **3.1 Visible Only**

Label objects **only if visible** in the image.

| Case                | Labeling Decision              |
| ------------------- | ------------------------------ |
| Fully visible       | Label normally                 |
| Partially visible   | Label the visible portion only |
| Completely occluded | Do **not** label               |

### 3.2 Do Not Infer Hidden Boundaries

If the object goes outside the image or behind another object:

* Draw polygon **only around the visible part**.

### 3.3 Object-Texture vs. Object-Class

Some regions are tricky:

* A picture of a car printed on a sign is **not a car** — it's part of the **sign**.
* A painting of sky is **not sky** — it's part of the **wall**.

Annotate based on **real physical entities**.

---

# 4. Borderlines and Common Ambiguities

Use these rules when boundaries are difficult.

### 4.1 Blurry Borders (fog, motion blur)

Estimate the most likely edge based on structure, not pixel color alone.

### 4.2 Very Thin Objects

Examples: wires, poles, street signs

* Use simplified shapes; do not attempt pixel-perfect tracing.
* Avoid zig-zag polygons.

### 4.3 Reflections & Shadows

| Region                     | Label as…                |
| -------------------------- | ------------------------ |
| Reflection of sky in water | **Water**, not Sky       |
| Plant shadow on wall       | **Wall**, not Vegetation |
| Car reflection on building | **Building**, not Car    |

### 4.4 Transparent Objects

Glass windows:

* If you see through them → label what’s behind? **No.**
  Label **the window as part of the building**

---

# 5. Category Overlaps & Priority

Sometimes categories appear inside one another (e.g., a person inside a car).

### General Rule: Label What Is Visible

* If a car blocks part of a person: label only the **visible portion** of the person.
* If vegetation partially covers a building: vegetation polygon sits **above** building polygon.

### No “Smart Guessing”

Do **not** draw entire shapes if they are not visible.

---

# 6. Background and Unlabeled Areas

* **Background** → areas that do not belong to any category.

Only use this category **when necessary**, not as shortcuts.

---

# 7. Consistency Rules

* Use **the same polygon boundary style** across all images.
* Review edge cases together
* Update this guideline when new scenarios appear
* Revisit earlier images as needed to fix inconsistencies.

### Ensure consistency in:

* How tight or loose polygons are
* How occluded objects are labeled
* Handling of reflections, shadows, and transparency

---

# 8. Quality Control

After annotation:

### ✔️ Perform Random Checks

* Recheck 5–10% of images.

### ✔️ Validate Polygon Geometry

* No self-crossing polygons
* No missing segments
* No empty or point-only polygons

---

# 9. Avoid Bias

* Do not assume object identity (e.g., “this must be a car because it’s a road scene”).
* Only label what the pixels show.
* Don’t let previous images influence the current one.
* Stay objective with boundaries and occlusions.

---

# 10. Documentation & Revision

Maintain a log of:

* Difficult or unusual cases
* Decisions on new edge cases
* Changes in annotation rules

This ensures future annotators maintain the same quality.

---

# 11. Polygon Annotation Workflow (Decision Tree)

```
              ┌────────────────────────────┐
              │ Is the region a valid       │
              │ object in the class list?   │
              └───────────┬────────────────┘
                          │
                 ┌────────┴────────┐
                 │                 │
                Yes               No
                 │                 │
         ┌───────┴───────┐     ┌───────────────────────────┐
         │ Draw polygon   │     │ Do NOT annotate            │
         │ around visible │     │ (mark as background/void)  │
         │ region         │     └───────────────────────────┘
         └───────┬───────┘
                 │
    ┌────────────┴────────────┐
    │ Is object partially      │
    │ occluded or truncated?   │
    └──────────┬──────────────┘
               │
        ┌──────┴──────┐
        │             │
      Yes            No
        │             │
┌──────────────┐   ┌────────────────┐
│ Annotate ONLY │   │ Annotate full  │
│ visible part  │   │ boundary       │
└──────────────┘   └────────────────┘
```

---

# 12. Examples of Borderline Cases

| Scenario                             | How to Label                                                  |
| ------------------------------------ | ------------------------------------------------------------- |
| Tree behind a semi-transparent fence | Label only visible tree portions + fence separately           |
| Fog obscures distant mountains       | Estimate boundary; do not leave sky-colored pixels unassigned |
| Water with sky reflection            | Label **Water**, not Sky                                      |
| Broken car parts on the ground       | Label as **Car_Parts** if class exists, not as **Car**        |
| Distant cars too small to outline    | Either outline roughly or mark as Background (define rule)    |
| People behind glass                  | Label as **Person**, ignore reflection distortions            |
| Sand–soil similar color              | Use texture, shape, and domain context, not color alone       |

---

# Summary Table

| Rule                         | Description                                     |
| ---------------------------- | ----------------------------------------------- |
| 1️⃣ Label only visible parts | No guessing or hidden object completion         |
| 2️⃣ Draw polygons cleanly    | No overlapping, self-crossing, or messy shapes  |
| 3️⃣ Be consistent            | Same approach to borders, occlusion, and detail |
| 4️⃣ Use correct category     | Based on pixel evidence, not assumptions        |
| 5️⃣ Avoid bias               | Keep annotations objective                      |
| 6️⃣ Log difficult cases      | Update guideline as dataset evolves             |
| 7️⃣ Follow quality checks    | Validate geometry + annotation completeness     |