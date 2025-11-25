# Facial Landmarks with Keypoints

This repository contains **facial landmarks annotation projects** at three levels of detail: 5, 21, and 68 keypoints per face. Each subproject demonstrates **manual keypoint annotation using CVAT (Computer Vision Annotation Tool)**, dataset validation, and analytical reporting.

The projects focus entirely on **annotation quality**, **dataset completeness**, and **keypoint distribution insights**. No model training is included.

---

## Subprojects

| Subproject                                                                 | Keypoints | Description                                                                                                                                                                           |
| -------------------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [5-Keypoints](./5-Keypoints/CVAT/Manual)   | 5         | Minimal facial keypoints (eyes, nose, mouth corners) for coarse facial landmark representation. Includes annotation guidelines, analysis notebook, and distribution report.           |
| [21-Keypoints](./21-Keypoints/CVAT/Manual) | 21        | Medium-detail facial landmarks (jawline, eyebrows, eyes, nose, mouth). Provides dataset statistics, keypoint quality checks, distribution plots, and Markdown reporting.              |
| [68-Keypoints](./68-Keypoints/CVAT/Manual) | 68        | Full detailed facial landmarks (jawline, eyebrows, eyes, nose, mouth, lips). Includes complete annotation analysis, quality validation, distribution plots, and GitHub-ready reports. |

---

## Repository Structure

```plaintext
Facial-Landmarks-with-Keypoints/
├── 5-Keypoints/CVAT/Manual
│   ├── annotations/
│   ├── data/
│   ├── notebooks/
│   ├── results/
│   ├── README.md
│   └── before_after.gif
├── 21-Keypoints/CVAT/Manual
│   ├── annotations/
│   ├── data/
│   ├── notebooks/
│   ├── results/
│   ├── README.md
│   └── before_after.gif
├── 68-Keypoints/CVAT/Manual
│   ├── annotations/
│   ├── data/
│   ├── notebooks/
│   ├── results/
│   ├── README.md
│   └── before_after.gif
└── README.md    # (You are here)
```

---

## Features

* Manual facial keypoint annotation across multiple levels of detail
* CVAT XML point export processing and validation
* Dataset-level statistics (annotations per image, per label, invalid points)
* Keypoint distribution visualization
* GitHub-ready Markdown reporting

---

## Usage

Each subproject is self-contained. Typical workflow:

1. Open the corresponding `notebooks/*.ipynb` notebook in Jupyter or Colab.
2. Update the path to `annotations/annotations.xml` if needed.
3. Run the notebook to generate:

   * Keypoint statistics
   * Evaluation summary
   * Distribution plots
   * Markdown report (`report.md`)

---

## About the Author

**Karan Heera**

GitHub: [https://github.com/karanheera](https://github.com/karanheera)
LinkedIn: [https://linkedin.com/in/karanheera](https://linkedin.com/in/karanheera)

---

## Summary

This repository demonstrates **progressive facial landmark annotation proficiency**:

1. Coarse annotation with **5 keypoints**
2. Medium-detail annotation with **21 keypoints**
3. Full-detail annotation with **68 keypoints**

All projects focus on **annotation quality**, **dataset validation**, and **visualization**, making them suitable for **research, dataset creation, or portfolio demonstration**.

---

## Special Thanks & Image Credits

Images sourced from:

* Pexels — [https://www.pexels.com](https://www.pexels.com)

Used under respective free-to-use licenses for non-commercial research and educational purposes.
