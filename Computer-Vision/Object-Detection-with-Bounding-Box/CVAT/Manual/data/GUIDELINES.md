# Object Detection (Bounding Box) Annotation Guidelines

*Dataset: Indoor, Outdoor, and Street Scenes*

These guidelines describe how to annotate **images** for **object detection** using **bounding boxes** in CVAT. The goal is to identify all relevant objects and draw **tight, accurate boxes** around them, assigning the correct **class label** from the dataset.

---

## 1. Object Categories

| Label                | Description / Examples                                      |
| -------------------- | ----------------------------------------------------------- |
| **Bathroom_Cubicle** | Stall or cubicle in a bathroom                              |
| **Sink**             | Washbasin in bathrooms or kitchens                          |
| **Toilet**           | Toilet bowls or urinals                                     |
| **Faucet**           | Water taps associated with sinks or sinks                   |
| **Cabinet**          | Storage cabinets, cupboards                                 |
| **Mirror**           | Wall-mounted or standalone mirrors                          |
| **Mannequin**        | Display mannequins in stores                                |
| **Auto**             | Auto-rickshaws, tuk-tuks, three-wheelers                    |
| **Rickshaw**         | Traditional rickshaws, cycle rickshaws                      |
| **Person**           | Any human figure, fully or partially visible                |
| **Umbrella**         | Open or closed umbrellas                                    |
| **Car**              | Sedans, SUVs, taxis, parked or moving vehicles              |
| **Sign_Board**       | Store signs, street signs, advertisement boards             |
| **Bicycle**          | Human-powered bicycles                                      |
| **Motorcycles**      | Motorbikes, scooters                                        |
| **Camera**           | Standalone cameras, security cameras                        |
| **Laptop**           | Laptop devices                                              |
| **Table**            | Tables, desks                                               |
| **Plant**            | Potted plants, small trees                                  |
| **Chair**            | Chairs, stools                                              |
| **Box**              | Cardboard boxes, parcels                                    |
| **Tablet**           | Tablets or similar handheld devices                         |
| **Hand**             | Human hands (if isolated from full body)                    |
| **Arm**              | Human arms (if isolated from full body)                     |
| **Books**            | Stacks of books or single books                             |
| **Mobile**           | Mobile phones                                               |
| **Machinery**        | Industrial or store machinery                               |
| **Bottle**           | Bottles, cans, or drink containers                          |
| **Tool**             | Hand tools, construction tools                              |
| **Traffic_Lights**   | Traffic light signals                                       |
| **Bus**              | Buses                                                       |
| **Truck**            | Trucks                                                      |
| **Toys**             | Toy items in stores                                         |
| **Pipes**            | Exposed pipes in walls, ceilings                            |
| **Valves**           | Industrial or household valves                              |
| **Technology**       | Electronics other than specified (e.g., printers, monitors) |
| **Bird**             | Birds visible in images                                     |
| **Fracture**         | Visible cracks or broken parts                              |
| **Fields**           | Open fields or farmland                                     |
| **Tramp**            | Homeless person or vagrant                                  |

> ⚠️ If you are unsure about a class, **skip the object** rather than guessing.

---

## 2. Bounding Box Guidelines

* Draw **tight boxes** around objects without including unrelated background.
* Include all **visible parts**, even if partially occluded.
* Use **axis-aligned rectangles**; do not rotate boxes.
* Annotate **each object separately**, even if touching or overlapping.

---

## 3. Occlusion Handling

* Annotate **partially visible objects**.
* Skip objects if less than ~10% is visible, unless instructed otherwise.

---

## 4. Small or Distant Objects

* Zoom in for **small objects** to annotate clearly.
* Skip objects too small to identify confidently.

---

## 5. Overlapping and Clustered Objects

* Draw individual boxes for each object.
* Boxes can **overlap**.
* Do not merge multiple objects into one box.

---

## 6. Ambiguous Cases

| Scenario                               | Rule                                           |
| -------------------------------------- | ---------------------------------------------- |
| Object partially cropped at image edge | Box visible part, label normally               |
| Reflections or glass surfaces          | Annotate only visible object, skip reflections |
| Blurry or unidentifiable object        | Skip or mark as **Uncertain**                  |
| Object not in dataset classes          | Skip                                           |

---

## 7. Consistency Rules

* Use **same class label** for same object type across images.
* Check previous annotations to maintain **uniformity**.
* Discuss unclear or new cases with project lead before annotating.

---

## 8. CVAT Annotation Tips

* Use zoom, panning, and shortcut keys for accuracy and speed.
* Annotate **larger objects first**, then smaller objects.
* Save frequently to avoid data loss.

---

## 9. Quality Control

* Randomly review 5–10% of labeled images for **accuracy**.
* Multiple annotators: compute **inter-annotator agreement**.
* Document **common mistakes** and edge cases.

---

## 10. Decision Flow for Annotation

```
            ┌─────────────────────────────┐
            │ Is the object visible?      │
            └─────────────┬──────────────┘
                          │
                   ┌──────┴───────┐
                   │              │
                 Yes              No
                   │              │
      ┌────────────┴─────────────┐
      │ Can object be identified? │
      └────────────┬─────────────┘
                   │
                Yes │ No
                   │
      ┌────────────┴─────────────┐
      │ Draw bounding box & label │
      └──────────────────────────┘
```

---

## 11. Summary Table

| Rule                       | Description                                        |
| -------------------------- | -------------------------------------------------- |
| 1️⃣ Define classes clearly | Use project-defined labels                         |
| 2️⃣ Draw tight boxes       | Cover visible object fully, avoid extra background |
| 3️⃣ Handle occlusion       | Annotate partially visible objects                 |
| 4️⃣ Multiple objects       | Separate boxes for each object                     |
| 5️⃣ Small/distant objects  | Zoom and annotate if identifiable                  |
| 6️⃣ Overlaps               | Boxes can overlap, label individually              |
| 7️⃣ Ambiguous cases        | Skip or mark uncertain                             |
| 8️⃣ Consistency            | Same object → same class label                     |
| 9️⃣ Review quality         | Random checks, inter-annotator agreement           |
| 🔟 Avoid bias              | Annotate only what is visible                      |
| 1️⃣1️⃣ Update guidelines   | Document edge cases, clarify rules                 |

