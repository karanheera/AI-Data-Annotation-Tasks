# Semantic Segmentation with Mask — Annotation Guidelines

These guidelines describe how to annotate image data for **semantic segmentation** using **mask-based pixel labeling**.
The objective is to assign a **class label to every pixel** that belongs to a defined category in the dataset.

---

## 1. Purpose of Mask-Based Semantic Segmentation

Semantic segmentation assigns a class label to each pixel in an image.
Mask-based annotation means that regions are represented as dense pixel masks rather than polygons or bounding boxes.

Each mask corresponds to one class and covers exactly the visible pixels belonging to that class.

---

## 2. Classes and Categories

Your dataset contains multiple classes such as:

* Shape
* Chair
* Table
* Floor
* Background
* Drawers
* Cabinets
* Oven
* Dishwasher
* Cooktop
* Faucet
* Sink
* Person
* Car
* Trees
* Water
* Grass
* Sky
* Dog
* Penguin
* Machinery
* Books
* Racks
* and others.

Annotators must assign each pixel to exactly one category based on what it visually represents.
Class definitions should remain stable across the entire dataset.

---

## 3. General Annotation Rules

1. Label only the pixels that truly belong to the object or region.
2. Each pixel must belong to exactly one class; avoid overlaps or double assignments.
3. When annotating, follow the natural visual boundaries of the object.
4. Include all visible parts of the object, even if only partially shown in the image.
5. Exclude any background or unrelated pixels around the object.

---

## 4. Occlusion and Partial Visibility

If an object is partly occluded:

* Annotate only the **visible** portion.
* Do not guess or reconstruct the hidden portion.
* Maintain consistent interpretation of partially visible objects across images.

---

## 5. Stuff vs. Thing Categories

Semantic segmentation datasets often include two types of classes:

### Thing Classes

Discrete countable objects
Examples: Chair, Person, Car, Dog, Cabinet.

Guidelines:

* Label the exact pixel boundaries of the instance.
* Treat each instance separately if the dataset requires instance labels; if not, a single combined mask per class is acceptable.

### Stuff Classes

Continuous, uncountable regions
Examples: Floor, Grass, Sky, Water, Land, Road.

Guidelines:

* Label connected continuous regions for each class.
* Do not break one region into multiple masks unless they are not connected.

---

## 6. Handling Ambiguous Regions

Ambiguity may arise in situations such as:

* Weak or unclear boundaries
* Low contrast between object and background
* Objects with similar appearance to other classes

In such cases:

* Rely on overall shape, texture, or context when available.
* If class is still unclear, choose the closest matching category and document the decision.
* Maintain the same interpretation for similar patterns in future images.

---

## 7. Annotation Consistency

Consistency across images is critical for creating a machine-learning-ready dataset.

Maintain consistency in:

* Class choice
* Boundary precision
* Treatment of occlusion
* How small objects or details are handled
* How fine structural details are included or ignored

If new edge cases appear, record the rule in a shared notes file to ensure other annotators follow the same approach.

---

## 8. Inclusion and Exclusion Rules

### Include:

* All visually identifiable pixels belonging to a class
* Partial objects
* Small components of objects (handles, ears, fins, leaves, etc.)

### Exclude:

* Shadows cast by objects
* Reflections unless they represent the actual object
* Regions obstructed by other objects
* Background pixels mistakenly inside an object boundary

---

## 9. Handling Small, Thin, or Complex Objects

Some classes have small or detailed structures (e.g., Hand, Faucet, Transistors, Chip).

Guidelines:

* Capture essential shape without extreme pixel-level precision when boundaries become ambiguous.
* Avoid over-smoothing or over-detailing; follow visible contours.
* Ensure the object is represented clearly enough for recognition.

---

## 10. Quality Control

After annotating each image:

1. Review the masks for correct class labeling.
2. Ensure that no regions are left unannotated if the class set requires complete coverage.
3. Check that mask edges follow the visual boundary.
4. Confirm that no pixels belong to two different masks.
5. Verify that no unintended or stray marks exist.
6. Toggle mask visibility or compare mask outline against the raw image to ensure alignment.

Periodic review of a subset of images is recommended to maintain annotation uniformity.

---

## 11. Documentation and Revision

Maintain a running record of:

* Ambiguous cases encountered
* Any updates to class definitions
* Common errors and how they are resolved
* Special rules created for certain object types

This ensures future annotators can follow the same standards.

---

## 12. Annotation Checklist

Use this checklist before finalizing an image:

* All relevant classes are annotated
* No class is used incorrectly
* Pixel boundaries align with the visible object’s shape
* Only visible parts are labeled
* Stuff regions are continuous where appropriate
* No gaps or missed areas in large regions
* No contamination from background pixels inside masks
* All masks are reviewed and consistent with guidelines

---

## 13. Summary Table

| Rule                                        | Description                             |
| ------------------------------------------- | --------------------------------------- |
| Label only visible pixels                   | Do not infer hidden shapes              |
| Use correct class categories                | Follow dataset definitions              |
| Maintain boundary accuracy                  | Keep outlines clean and consistent      |
| Avoid overlaps and gaps                     | Each pixel belongs to one category only |
| Treat stuff and thing classes appropriately | Continuous vs. discrete                 |
| Ensure annotation consistency               | Same rule applied across all images     |
| Perform quality checks                      | Review masks before finalization        |
| Document exceptions                         | Maintain clarity for future work        |

