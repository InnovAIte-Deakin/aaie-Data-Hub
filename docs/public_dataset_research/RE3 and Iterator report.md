# RESEARCH REPORT:  
## RE3 and Iterator Datasets for Revision-Focused NLP Applications

### INTRODUCTION  
In recent years, there has been increasing interest in developing Natural Language Processing (NLP) systems that can understand and support iterative writing processes. This shift moves beyond static evaluation of text quality and aims to model how writers revise and improve their content over time. To support such advancements, high-quality revision datasets are critical.  

This research focuses on two publicly available and academically endorsed datasets: **RE3** (Revision Extraction and Evaluation for Research Papers) and **Iterator** (Iterative Revision Dataset for Argumentative Writing). Both datasets capture different domains and types of revisions, offering complementary resources for the development of NLP models targeting revision detection, generation, and evaluation.

---

### Dataset 1: RE3  
- **Name:** Revision Extraction and Evaluation for Research Papers (RE3)  
- **Source:** UKP Lab GitHub Repository
- **URL:** https://github.com/UKPLab/re3
- **License:** CC BY-NC-SA 4.0  
- **Permission:** Please note that this dataset is a candidate for future consideration only. It can be used with the approval from the project PO and leadership after a full review.

#### Description  
RE3 is a curated corpus comprising revision histories of academic research papers, collected from arXiv preprints. It provides pairs of paper versions (typically v1 and v2) and annotations that highlight sentence-level changes between them. The dataset captures fine-grained edits including addition, deletion, replacement, and reordering of text. These changes are aligned using a combination of sentence alignment algorithms and manual annotations, making the dataset suitable for edit classification, revision intention analysis, and academic writing improvement tools.

#### Features  
- Includes around 20,000 sentence pairs from academic texts.  
- Annotations label the type of revision and whether it affects meaning or clarity.  
- Supports research in argumentation mining, document comparison, and version control.

#### Use Cases  
- Training NLP models to suggest or predict academic writing edits.  
- Supporting writing tutors and feedback systems for scholarly authors.  
- Analyzing how academic authors revise arguments and structure across drafts.

---

### Dataset 2: Iterator  
- **Name:** Iterator – Iterative Revision Dataset for Argumentative Writing  
- **Source:** Vipul Raheja GitHub Repository
- **URL:** https://github.com/vipulraheja/iterater
- **License:** CC BY-NC 4.0  
- **Permission:** Granted via direct communication with dataset authors (see screenshots in Appendix)

#### Description  
Iterator is a large-scale dataset developed to model student revision behavior on argumentative essays. It contains over 21,000 pairs of drafts and their revisions, sourced from student submissions to Cambridge English’s Write & Improve platform. Each entry includes the original draft, revised version, system-generated feedback, and in some cases, human tutor feedback. The dataset captures a diverse range of linguistic improvements, from surface-level grammar fixes to deeper argumentative restructuring.

#### Features  
- Focus on iterative improvement rather than one-time editing.  
- Includes automated and human feedback.  
- Covers a wide variety of topics and writing styles.  
- High volume of real student data, enhancing model generalizability.

#### Use Cases  
- Developing AI writing assistants that provide meaningful revision feedback.  
- Training models in automated essay scoring with revision tracking.  
- Studying student learning patterns in language acquisition and academic writing.

---

### Conclusion  
Both RE3 and Iterator datasets contribute significantly to the field of revision-aware NLP. While RE3 emphasizes academic clarity and argument enhancement in scholarly texts, Iterator provides rich insights into how learners revise their essays based on feedback.  

Researchers and developers aiming to build tools for automated writing support, intelligent tutoring systems, or revision generation can benefit from integrating both datasets. With proper permissions obtained for academic usage, these datasets offer ethical, high-quality resources for advancing next-generation NLP applications focused on continuous writing improvement.

---

### References  
- Raheja, V., et al. (2023). *Iterator: A Large-Scale Dataset for Iterative Revision of Argumentative Writing.*  
- Stab, C., et al. (2017). *Detecting Style and Scope of Revisions in Academic Writing.* Proceedings of the ACL.  
- [UKP Lab RE3 GitHub Repository](https://github.com/UKPLab/re3)  
- [Iterator GitHub Repository](https://github.com/vipulraheja/iterater)

---




