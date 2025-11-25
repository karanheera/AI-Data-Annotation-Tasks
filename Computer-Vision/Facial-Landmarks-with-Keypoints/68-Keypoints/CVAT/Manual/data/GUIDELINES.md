# Facial Landmarks 68-Keypoints Annotation Guidelines

This document provides detailed instructions for annotating **68 facial keypoints** on human faces using **CVAT (Computer Vision Annotation Tool)**. Following these guidelines ensures **consistency, accuracy, and reproducibility** across the dataset.

---

## Table of Contents

1. [General Instructions](#general-instructions)
2. [Annotation Tool Setup](#annotation-tool-setup)
3. [Keypoints Definition](#keypoints-definition)
4. [Annotation Order & Naming](#annotation-order--naming)
5. [Occlusion & Visibility Rules](#occlusion--visibility-rules)
6. [Quality Control](#quality-control)
7. [Exporting & File Naming](#exporting--file-naming)
8. [References](#references)

---

## General Instructions

* Annotate **all frontal and profile faces** visible in an image.
* Use the **68-point facial landmarks** standard, covering jawline, eyebrows, eyes, nose, and mouth.
* Ensure **precise placement** of each point, especially around critical facial features (eyes, mouth, nose tip).
* Do **not skip any points** unless the feature is **completely occluded**.

---

## Annotation Tool Setup

1. Open the project in **CVAT**.
2. Load the image sequence or dataset.
3. Select the **Points (keypoints)** tool for annotation.
4. Create a label for each keypoint according to the **68-point naming convention** (see below).
5. Adjust zoom for **pixel-level accuracy**.

---

## Keypoints Definition

The 68 keypoints are divided into the following regions:

| Region            | Keypoints (Index) | Description                                          |
| ----------------- | ----------------- | ---------------------------------------------------- |
| **Jawline**       | 0–16              | Rightmost to leftmost jawline points                 |
| **Right Eyebrow** | 17–21             | Outer end to inner end                               |
| **Left Eyebrow**  | 22–26             | Inner end to outer end                               |
| **Nose Bridge**   | 27–30             | Top to bottom, including tip                         |
| **Nostrils**      | 31–35             | Edges of nostrils                                    |
| **Right Eye**     | 36–41             | Outer corner, upper/lower eyelids, inner corner      |
| **Left Eye**      | 42–47             | Inner corner, upper/lower eyelids, outer corner      |
| **Mouth Outer**   | 48–54             | Right corner, upper/lower lip midpoints, left corner |
| **Mouth Inner**   | 60–67             | Inner upper/lower lip, left/mid/right positions      |

> Each keypoint has a **unique label in CVAT**. For example: `0_Jawline rightmost`, `30_Nose Tip Center`, `48_Mouth right corner`.

---

## Annotation Order & Naming

* Annotate **sequentially** from jawline → eyebrows → eyes → nose → mouth.
* Maintain **consistent labeling across all images**.
* Avoid duplicating or skipping labels.
* Use the CVAT naming exactly as in the XML, e.g., `36_Right eye outer corner`.

---

## Occlusion & Visibility Rules

* If a point is **partially occluded** (hair, hand, mask), mark it at its **approximate anatomical location**.
* If a point is **completely invisible**, leave it unannotated.
* Use the **occluded attribute in CVAT** to mark hidden keypoints (`occluded="1"`).
* Avoid placing points on non-facial objects.

---

## Quality Control

1. Verify that **all 68 points are annotated** for visible faces.
2. Check that **no points fall outside the image boundaries**.
3. Zoom in to ensure **keypoints align with facial contours**.
4. Check for **symmetry** between left/right features.
5. Perform a **dataset-level validation**:

   * Count points per image
   * Count points per label
   * Identify missing or out-of-bound points

---

## Exporting & File Naming

* Export dataset as **CVAT XML** (`annotations.xml`).
* Each `<image>` entry should include all annotated points for that face.
* Maintain **original image names** for traceability.
* Include metadata: annotator name, annotation date, and version.

---

## References

* [iBUG 300-W: Facial Landmarks Standard](https://ibug.doc.ic.ac.uk/resources/facial-point-annotations/)
* [CVAT User Guide](https://openvinotoolkit.github.io/cvat/docs/)
* Academic papers on facial landmark detection and annotation best practices.

---

## Notes

* Follow these guidelines **strictly** to ensure dataset consistency.
* Proper annotation enables **high-quality facial landmark models** and downstream tasks such as face alignment, emotion recognition, and 3D reconstruction.
