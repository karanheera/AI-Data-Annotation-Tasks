# Facial Landmarks Annotation Guidelines (5 Keypoints)

This document provides detailed guidelines for annotating **facial keypoints** using **CVAT**. The project focuses on **5-point facial landmarks** to capture essential facial features for downstream tasks like face alignment or recognition.

---

## Annotation Format

* **Export Format:** CVAT XML (`annotations.xml`)
* **Annotation Type:** Points (single coordinates per keypoint)
* **Labels (5 Keypoints):**

  1. `1_Right eye` – Center of the right eye
  2. `2_Left eye` – Center of the left eye
  3. `3_Nose tip` – Tip of the nose
  4. `4_Mouth right corner` – Right corner of the mouth
  5. `5_Mouth left corner` – Left corner of the mouth

---

## General Annotation Rules

1. **Point Placement Accuracy**

   * Click exactly at the center of each facial feature.
   * Avoid approximations — small offsets can impact model performance.

2. **Visibility / Occlusion**

   * Annotate visible keypoints only.
   * If a keypoint is occluded or not visible, do **not annotate** it.

3. **Image Quality**

   * Ensure images are properly oriented (no rotation or flips).
   * Brightness, contrast, or slight blur is acceptable, but keypoints must be clear.

4. **Label Consistency**

   * Always use the same label for the same facial feature across images.
   * Example: Always label the right eye as `1_Right eye`, never interchange.

5. **Coordinate System**

   * Points should be defined in the **image pixel coordinate system** (as provided by CVAT).
   * Top-left corner is `(0,0)`; x increases rightwards, y increases downwards.

---

## Keypoint-Specific Guidelines

| Keypoint             | Placement Instructions                                       |
| -------------------- | ------------------------------------------------------------ |
| 1_Right eye          | Center of the right eyeball, slightly inside eyelid edges.   |
| 2_Left eye           | Center of the left eyeball, slightly inside eyelid edges.    |
| 3_Nose tip           | Tip of the nose, visually the lowest point of the nose tip.  |
| 4_Mouth right corner | Outer right corner of the mouth, aligned with the lips edge. |
| 5_Mouth left corner  | Outer left corner of the mouth, aligned with the lips edge.  |

---

## Annotation Workflow

1. Open the image in CVAT.
2. Select the **Points tool**.
3. Choose the correct **label** (e.g., `1_Right eye`).
4. Click exactly on the keypoint location.
5. Repeat for all 5 keypoints per visible face.
6. Save frequently to avoid data loss.

---

## Common Mistakes to Avoid

* Annotating points outside the facial region.
* Confusing left and right sides of the face.
* Placing points on occluded or heavily blurred regions.
* Skipping keypoints that are clearly visible.

---

## Quality Checks

* Each image should have **5 points** if all features are visible.
* Missing points must be noted in metadata if they are occluded.
* Ensure **no duplicate keypoints** per label.
* Coordinates should be within image dimensions.

---

## Dataset Notes

* Images may include **faces in different poses, lighting conditions, and scales**.
* Each image can have **multiple faces**, annotate **all visible faces** consistently.
* The final XML will contain `<points>` elements for each keypoint with attributes:

  * `label`: keypoint label
  * `points`: x,y coordinates
  * `occluded`: 0 (visible) or 1 (occluded)
  * `source`: manual

