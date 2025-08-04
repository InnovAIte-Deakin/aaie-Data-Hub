# RESEARCH REPORT:  
## DREsS and ASAP 2.0 Datasets for Feedback NLP Applications

### INTRODUCTION  
To support the development of intelligent assessment tools capable of providing appropriate feedback on students' essay submissions, it is necessary to enhance the current synthesised dataset created by the Data Team with a more diverse range of writing samples.

This document outlines two external rubric-based feedback datasets that are suitable for this purpose. These large-scale datasets were selected based on their widespread use in academic research.

---

### Dataset 1: DREsS  
- **Name:** Dataset for Rubric-based Essay Scoring on EFL Writing   
- **Source:** https://haneul-yoo.github.io/dress/
- **URL:** https://forms.gle/WCSzhyRkr4jgeeYS7
- **License:** CC BY 4.0 
- **Permission:** Please note that this dataset is a candidate for future consideration only. It can be used with the approval from the project PO and leadership after a full review.

#### Description  
The DREsS dataset is a large-scale, rubric-based essay scoring resource designed for English as a Foreign Language (EFL) writing education, comprising over 48,000 real and synthetic student essays annotated by experts. DREsS comprises three sub-datasets: 

- DREsS_New: 2,279 essays from English as a foreign language (EFL) learners and their scores assessed by experts.  
- DREsS_Std: 6,515 essays and scores from existing datasets.
- DREsS_CASE: 40,185 synthetic essay samples.

#### Features  
- Contain real classroom essays from EFL students, matching a direct use case of our requirements.   
- Annotations across content, organisation and language.
- Scoring performed by professionals with pedagogical expertise in English writing.  

#### Use Cases  
- Training NLP models on feedbacks for essay submissions from students with non-English background.  
- Ideal for mapping to Data Team custom JSON schema.   

---

### Dataset 2: ASAP 2.0 Corpus   
- **Name:** ASAP 2.0 Corpus 
- **Source:** Scott Crossley GitHub Repository
- **URL:** https://github.com/scrosseye/ASAP_2.0?tab=readme-ov-file
- **License:** CC BY-NC 4.0  
- **Permission:** Please note that this dataset is a candidate for future consideration only. It can be used with the approval from the project PO and leadership after a full review.

#### Description  
The ASAP 2.0 Corpus is a large-scale dataset of 24,278 source-based persuasive essays written by students in grades 6–10, annotated with detailed demographic metadata and holistic quality scores to support research in automated writing evaluation.

#### Features  
- Different persuasive writing levels enriched with demographic metadata.  
- Essays are written in response to prompts that require students to read and integrate information from provided source texts.  
- Each essay is annotated with holistic quality scores based on a detailed scoring rubric used by trained human raters. 
- The dataset is divided into training and test sets.

#### Use Cases  
- Leveraging ASAP large persuasive essay samples across diverse populations to reduce bias.  
- Rubric-based scoring human written submissions for training LLMs on feedback generation.  

---

### Conclusion  
DREsS provides one of the largest source of rubric-aligned annotations tailored to EFL learners, making it ideal for usage like curating linguistically diverse writing samples that meet various assessment needs.

ASAP 2.0 delivers robust, source-based persuasive writing samples enriched with demographic metadata, making it a valuable resource for reducing bias and enhancing model generalisation for feedback generation.

Together, the two datasets represent strong candidates for strengthening the Data Team's existing framework and expanding feedback capabilities across a wider range of student profiles and writing contexts.

---

### References  
- [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) 
- Yoo, H., Han, J., Ahn, S.-Y. & Oh, A. (2024). *DREsS: Dataset for Rubric-based Essay Scoring on EFL Writing* arXiv preprint arXiv:2402.16733. Available at: https://arxiv.org/abs/2402.16733 [Accessed 4 Aug. 2025] 
- [CCC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en) 
- Crossley, S.A., Baffour, P., Burleigh, L. and King, J. (2025) 'A large-scale corpus for assessing source-based writing quality: ASAP 2.0', Assessing Writing, 67, 100954. doi: 10.1016/j.asw.2025.100954

---




