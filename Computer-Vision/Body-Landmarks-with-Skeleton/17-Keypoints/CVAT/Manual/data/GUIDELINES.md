# Body Landmarks with Skeleton Keypoints Annotation Guidelines

This document outlines the guidelines for annotating **body keypoints** using **COCO 17 keypoints** for human pose estimation. The dataset includes annotations of **17 keypoints** to represent key parts of the human body, useful for tasks such as pose detection, human tracking, and activity recognition.

---

## Annotation Format

* **Export Format**: COCO JSON (`annotations.json`)
* **Annotation Type**: Keypoints (coordinates for each landmark)
* **Categories**:

  * `Skeleton-Person` (for human body with keypoints)

### Keypoints (17 Total)

1. `1_Nose` – Center of the nose.
2. `2_Left Eye` – Center of the left eye.
3. `3_Right Eye` – Center of the right eye.
4. `4_Left Ear` – Center of the left ear.
5. `5_Right Ear` – Center of the right ear.
6. `6_Left Shoulder` – Center of the left shoulder.
7. `7_Right Shoulder` – Center of the right shoulder.
8. `8_Left Elbow` – Center of the left elbow.
9. `9_Right Elbow` – Center of the right elbow.
10. `10_Left Wrist` – Center of the left wrist.
11. `11_Right Wrist` – Center of the right wrist.
12. `12_Left Hip` – Center of the left hip.
13. `13_Right Hip` – Center of the right hip.
14. `14_Left Knee` – Center of the left knee.
15. `15_Right Knee` – Center of the right knee.
16. `16_Left Ankle` – Center of the left ankle.
17. `17_Right Ankle` – Center of the right ankle.

---

## General Annotation Rules

1. **Point Placement Accuracy**

   * Click **exactly** at the center of each keypoint.
   * Avoid approximations. Slight offsets can affect downstream tasks like pose detection or tracking accuracy.

2. **Visibility / Occlusion**

   * Annotate only **visible** keypoints.
   * If a keypoint is occluded (e.g., blocked by other objects or out of view), **do not annotate** it.
   * For occluded keypoints, use the `occluded` field to mark them.

3. **Image Quality**

   * Ensure images are **properly oriented**. Avoid rotated or flipped images unless specified.
   * While **brightness**, **contrast**, or slight **blur** are acceptable, keypoints must be clearly visible in the image.

4. **Label Consistency**

   * Always use the **same label** for the same body part across all images.
   * Example: The left eye should always be labeled as `2_Left Eye`.

5. **Coordinate System**

   * Points should be defined in the **image pixel coordinate system**.
   * The origin is the **top-left corner** of the image, where `(0,0)` is the top-left corner, `x` increases to the right, and `y` increases downwards.

---

## Keypoint-Specific Guidelines

| Keypoint         | Placement Instructions                                             |
| ---------------- | ------------------------------------------------------------------ |
| 1_Nose           | The center of the nose, located at the tip.                        |
| 2_Left Eye       | The center of the left eyeball, slightly inside the eyelid.        |
| 3_Right Eye      | The center of the right eyeball, slightly inside the eyelid.       |
| 4_Left Ear       | The center of the left ear, near the outer edge.                   |
| 5_Right Ear      | The center of the right ear, near the outer edge.                  |
| 6_Left Shoulder  | The center of the left shoulder, typically at the shoulder joint.  |
| 7_Right Shoulder | The center of the right shoulder, typically at the shoulder joint. |
| 8_Left Elbow     | The center of the left elbow joint.                                |
| 9_Right Elbow    | The center of the right elbow joint.                               |
| 10_Left Wrist    | The center of the left wrist joint.                                |
| 11_Right Wrist   | The center of the right wrist joint.                               |
| 12_Left Hip      | The center of the left hip joint.                                  |
| 13_Right Hip     | The center of the right hip joint.                                 |
| 14_Left Knee     | The center of the left knee joint.                                 |
| 15_Right Knee    | The center of the right knee joint.                                |
| 16_Left Ankle    | The center of the left ankle joint.                                |
| 17_Right Ankle   | The center of the right ankle joint.                               |

---

## Annotation Workflow

1. **Open the image** in your annotation tool (e.g., COCO Annotator or CVAT).
2. Select the **Keypoints tool** for annotation.
3. For each visible person, choose the correct **label** (e.g., `1_Nose`, `2_Left Eye`, etc.).
4. **Click exactly** on each keypoint location to place the points.
5. Repeat the process for **all visible keypoints** per person.
6. **Save** your work frequently to avoid data loss.

---

## Common Mistakes to Avoid

* **Mislabeling keypoints** (e.g., confusing left and right sides).
* **Placing keypoints outside the body region**.
* **Annotating occluded or heavily blurred keypoints**.
* **Skipping visible keypoints** due to oversight.
* **Not maintaining consistency in labeling** across images.

---

## Quality Checks

* **Each annotation** should have **17 points** if all keypoints are visible.
* **Missing points** should be noted in the annotation's metadata (e.g., using the `occluded` attribute).
* Ensure that **no duplicate keypoints** are annotated.
* **Coordinates** should always fall within the image dimensions. If a keypoint's coordinate exceeds the image size, recheck its placement.

---

## Dataset Notes

* Images may contain **multiple people**. Ensure **all visible persons** are annotated.
* The dataset may include people in **various poses**, **lighting conditions**, and **scales**.
* The final **COCO JSON** will contain entries for each keypoint with the following fields:

  * `label`: Keypoint label (e.g., `1_Nose`, `2_Left Eye`).
  * `points`: `(x, y)` coordinates for each keypoint.
  * `occluded`: 0 (visible) or 1 (occluded).
  * `num_keypoints`: The number of visible keypoints in the image.

