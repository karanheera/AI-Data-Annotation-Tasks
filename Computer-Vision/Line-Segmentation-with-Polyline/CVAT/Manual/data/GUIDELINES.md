# Line-Segmentation Annotation Guidelines
**Project:** Line-Segmentation with Polyline Annotations  
**Annotation Type:** Polyline (Vector Line)  
**Annotation Tool:** CVAT (Computer Vision Annotation Tool)  
**Export Format:** XML (CVAT native)

---

## 1. Objective

This project focuses on annotating **linear structures** in images, such as:

- Road lanes (left, right, center solid, center dashed)
- Curbs
- Cracks
- Rail tracks
- Tree branches and stems
- Utility lines (electricity, telephone)
- River centerlines

Annotations will be used for **line segmentation, lane detection, and infrastructure analysis**.

---

## 2. General Annotation Rules

1. **Polyline Annotation**  
   - Use **polyline tool** in CVAT to trace lines precisely.  
   - Connect consecutive points along the line for accurate representation.  
   - Ensure polylines follow the curvature or orientation of the object.

2. **Label Selection**  
   - Use the **exact label names** as provided:
     - `Lane_right_boundary`
     - `Lane_left_boundary`
     - `Lane_center_solid`
     - `Lane_center_dashed`
     - `Curb_line`
     - `Electricity_line`
     - `Telephone_line`
     - `Rail_track_line`
     - `Crack_line`
     - `River_centerline`
     - `Tree_branches`
     - `Tree_Stem`  
   - Do **not create new labels** unless instructed.

3. **Occlusion Handling**  
   - Annotate **visible portions only**.  
   - If part of a line is occluded but the trajectory is clear, you may continue the polyline, but mark `occluded="1"` in CVAT attributes.

4. **Polyline Precision**  
   - Use **enough points** to capture bends and curves accurately.  
   - Avoid using too few points, which may result in jagged or inaccurate lines.  
   - Avoid excessive points that do not improve accuracy.

---

## 3. Object-Specific Guidelines

### 3.1 Lanes
- **Right & Left Boundaries:** Trace the edge of the lane as a single continuous polyline.  
- **Center Solid / Dashed:** Follow the middle of the lane. Dashed lanes should include all dash segments as a single polyline if possible.

### 3.2 Curbs
- Annotate the top edge of the curb.  
- Include the full visible length in the image.  

### 3.3 Utility Lines
- **Electricity & Telephone Lines:** Trace lines along poles or aerial wires.  
- Include visible path, even if partially occluded by objects or trees.

### 3.4 Rail Tracks
- Trace the centerline along the visible track.  
- For curved tracks, follow the curvature accurately.

### 3.5 Cracks
- Trace each crack individually.  
- Only annotate visible cracks; do not extrapolate beyond the image.

### 3.6 River Centerlines
- Trace the middle of the river path.  
- Include curves and bends precisely.

### 3.7 Trees
- **Tree Branches:** Annotate prominent branches only; secondary twigs may be ignored.  
- **Tree Stem:** Trace from the base to the junction with branches.

---

## 4. Polyline Drawing Best Practices

1. Start from one end of the line and proceed to the other.  
2. Keep the polyline **single continuous line per object** unless broken by occlusion.  
3. Avoid overlapping polylines of the same label.  
4. Ensure polylines **do not extend beyond the object**.  

---

## 5. File & Metadata Conventions

- **XML Export:** Ensure the following attributes are properly set in CVAT:
  - `label`: Exact label name  
  - `source`: `manual`  
  - `occluded`: `0` if fully visible, `1` if partially occluded  
  - `points`: `x1,y1;x2,y2;...`  
  - `z_order`: Keep `0` unless layering is required  

- **Frame IDs:** If annotating videos, ensure `start_frame` and `stop_frame` are correct.  

---

## 6. Quality Checks

1. **Polyline Continuity:** Polylines should be continuous and smooth.  
2. **Label Consistency:** All instances of the same line type must have consistent labeling.  
3. **No Missing Annotations:** All visible lines should be annotated.  
4. **No Extra Polylines:** Avoid annotating noise or non-relevant elements.  

---

## 7. Summary

By following these guidelines, annotators ensure:

- **High-quality line segmentation**  
- **Accurate dataset for training and evaluation**  
- **Consistency across images and annotators**  

**Remember:** Precision and consistency are more important than speed.  

