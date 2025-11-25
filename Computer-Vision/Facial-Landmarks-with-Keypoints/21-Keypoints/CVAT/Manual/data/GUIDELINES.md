# Facial Landmarks (21-Keypoints) Annotation Guidelines

This document provides detailed instructions for **manual facial landmark annotation** with **21 keypoints per face**, suitable for consistent dataset creation using **CVAT**.

These keypoints cover the **eyebrows, eyes, nose, and mouth**, providing a dense representation for facial analysis, expression recognition, and 3D face alignment tasks.

---

## 1. Dataset Overview

* **Annotation type:** Points
* **Format:** CVAT XML
* **Number of keypoints per face:** 21
* **Images:** Variable resolution
* **Usage:** Face alignment, expression analysis, and facial landmark detection

---

## 2. Keypoint Definitions

Each facial keypoint has a specific anatomical location:

| #  | Keypoint Name              | Description / Placement                      |
| -- | -------------------------- | -------------------------------------------- |
| 1  | Right Outer Eyebrow        | Outer end of right eyebrow                   |
| 2  | Right Arch Eyebrow         | Arch of right eyebrow                        |
| 3  | Right Inner Eyebrow        | Inner end of right eyebrow, near nose bridge |
| 4  | Left Inner Eyebrow         | Inner end of left eyebrow, near nose bridge  |
| 5  | Left Arch Eyebrow          | Arch of left eyebrow                         |
| 6  | Left Outer Eyebrow         | Outer end of left eyebrow                    |
| 7  | Nose Tip                   | Tip of the nose                              |
| 8  | Right Nostril              | Outer edge of right nostril                  |
| 9  | Left Nostril               | Outer edge of left nostril                   |
| 10 | Right Outer Eye            | Outer corner of right eye                    |
| 11 | Right Middle Top Lid Eye   | Center of upper eyelid (right eye)           |
| 12 | Right Inner Eye            | Inner corner of right eye                    |
| 13 | Right Middle Lower Eye Lid | Center of lower eyelid (right eye)           |
| 14 | Left Inner Eye             | Inner corner of left eye                     |
| 15 | Left Middle Eye            | Center of eye (left eye)                     |
| 16 | Left Outer Eye             | Outer corner of left eye                     |
| 17 | Left Middle Lower Eye      | Center of lower eyelid (left eye)            |
| 18 | Right Mouth Corner         | Right corner of mouth                        |
| 19 | Middle Upper Lip           | Center point of upper lip                    |
| 20 | Left Mouth Corner          | Left corner of mouth                         |
| 21 | Middle Lower Lip           | Center point of lower lip                    |

---

## 3. Annotation Rules

### 3.1 General Rules

1. Use **manual point annotation** in CVAT.
2. Annotate **all 21 keypoints** per visible face.
3. Use **consistent labeling across images**.
4. For partially occluded faces:

   * Mark the visible keypoints.
   * Skip occluded points only if fully hidden.
5. Always annotate in the **image coordinate space**, (x, y) in pixels.

---

### 3.2 Eyes and Eyebrows

* Eyebrows (1–6) should follow the natural curvature.
* Eyes (10–17) should include inner/outer corners and midpoints for accurate eyelid representation.
* For closed eyes, annotate midpoints along the eyelid curve.

---

### 3.3 Nose

* Nose tip (7) is the most protruding point.
* Nostril points (8–9) are the outer edges of each nostril.

---

### 3.4 Mouth

* Corners of the mouth (18, 20) are the left and right extremities of the lips.
* Middle upper lip (19) and middle lower lip (21) are the midpoints along upper and lower lip curves.

---

## 4. Annotation Workflow in CVAT

1. Load image in CVAT.
2. Select **“Points” annotation tool**.
3. Click on each keypoint in the **order 1 → 21**.
4. Save frequently to avoid data loss.
5. Verify all points per image:

   * Correct label
   * Correct anatomical location
   * No duplicate points
6. Export annotations as **CVAT XML**.

---

## 5. Quality Guidelines

* **Accuracy:** ±2 pixels tolerance is acceptable for most images.
* **Consistency:** Ensure left/right keypoints are correctly labeled.
* **No missing points:** Every visible face must have **all 21 keypoints**.
* **Invalid points:** Mark occluded points in the “occluded” attribute if needed.

---

## 6. Notes for Difficult Cases

* **Partial faces:** Annotate only visible keypoints.
* **Profile faces:** Skip invisible keypoints but mark visible ones accurately.
* **Occlusions (hair, hand, glasses):** Skip occluded keypoints; set `occluded="1"` if necessary.

---

## 7. Final Checks

Before exporting:

1. Each face must have exactly **21 keypoints**.
2. Labels must match **CVAT XML definitions**.
3. Verify no points lie **outside the image**.
4. Check coordinate consistency for mirrored faces (left/right correctness).
