# Meeting Minutes: Smart Tech Prototypes – Concept Review & Project Alignment

**Date:** Recorded on October 7, 2026  
**Location / Medium:** Online meeting (Microsoft Teams)  
**Attendees:**  
- **Guest / Lecturer:** Researcher & educator from the Lectoraat / Master Applied Data Science (formerly at bol.com)  
- **Project Team Members:** Bart, Jay, Carlijn, and Maran  
- **Referenced Stakeholders & Lecturers:** Erwin, Joost Kraaijenveld, Bart Okups, Elisa, Rick, Karel de Heer, Pim Hanna, Charl, and Jorg  

---

## 1. Meeting Agenda & Structure

The meeting consisted of two distinct parts:
1. **Consultation with Guest / Lectoraat Member:** Evaluation of past promotional and recruitment activities ("Hansy Pie", Swarm Optimization, CoderDojo), followed by feedback on the student team’s three recruitment concepts.
2. **Internal Team Meeting:** Technical review of prototype builds, coordination of upcoming testing sessions, drafting lecturer communications, and reviewing the *Plan van Aanpak* (PvA).

---

## 2. Evaluation of Past Lectoraat Recruitment Activities

### A. "Hansy Pie" Beer
* **Concept & Mechanism:** A custom-brewed beer designed as an approachable conversation starter about AI applications. The team scraped data from Untappd for users visiting *Lokaal 99* (assumed student audience) and used recommender algorithms (similar to Netflix or bol.com) to craft an optimal flavor profile.
* **Effectiveness:** Proven to be an effective marketing tool at fairs; visitors approach out of curiosity about the beer, creating an opening to explain the underlying data science.
* **Application to Open Days & Minors:** The guest noted that alcohol cannot be served to minors at open days. While mocktail or cola adaptations were discussed, Untappd data for non-alcoholic drinks is limited. The primary target group for the beer was regional companies in *De Achterhoek*.
* **Recruitment Context:** The guest clarified that the Lectoraat focuses on research, companies, and the Master Applied Data Science, whereas HBO-ICT Bachelor recruitment is typically outsourced to a separate marketing team.

### B. Swarm Optimization Demo
* **Concept & Mechanism:** An algorithm inspired by bird flock communication used to navigate and optimize a multi-dimensional search space. Participants act as individual birds collaborating to locate an optimum. This was tied to the beer concept by mapping ingredients (e.g., hop and water ratios) on a 2D coordinate plane to find the optimal recipe.
* **Development & Iteration:** An earlier physical iteration required participants to walk across the floor and report coordinates, which proved slow and cumbersome. A mobile web version is currently being developed for faster interaction and customizable themes.
* **Application & Measurement:** Demonstrated at an alumni day to promote Lifelong Development (*Levenslang Ontwikkelen / LLO*) courses, such as *AI in de praktijk* and evening classes on LLMs/chatbots. The guest stated that direct recruitment conversions are not tracked; the primary goal is creating general awareness and mindshare.
* **Target Audience:** Best suited for prospective students interested in programming beyond standard chatbot interfaces.
* **Upcoming Demo:** The mobile version will be showcased in approximately one month at the Data Lab at Ruiterberglaan 26 in Arnhem.

### C. CoderDojo & Visual Programming
* **Target & Tooling:** Sessions designed for youth (ages 6–16) utilizing Scratch's visual block programming.
* **AI Integration:** Modules include webcam-based face detection (e.g., adding virtual party hats) and training computer vision models using webcam photos (e.g., recognizing a dog).
* **Recruitment Philosophy & Addressing Fears:** 
  * The guest noted that pitching AI strictly as "programming combined with statistics" intimidates prospective students.
  * Visual, low-barrier exercises demonstrate that foundational AI logic is accessible.
  * Regarding concerns about AI replacing software engineering jobs, the guest drew a historical comparison to Photoshop: rather than eliminating designers, Photoshop streamlined workflows and expanded the entire creative sector.

---

## 3. Review of the Project Team's Three Concepts

### Concept 1: Railway / Train System (*Spoorweg*)
* **Team Pitch:** A physical model train (or line-following vehicle) that gathers sensor data displayed on a live dashboard, hosted on a Raspberry Pi with a local database and Docker containers. It connects data science to public transportation used daily by students.
* **Guest Feedback:** Recommended framing the AI component around the **Traveling Salesman Problem** (calculating the most efficient route to pick up students across 10 locations). Comparing a fast, optimized algorithm against an unoptimized version on the physical track creates an immediate visual demonstration of AI value. The guest noted using this exact routing algorithm during his time at bol.com for warehouse order fulfillment.
* **Decision:** The team agreed to integrate the Traveling Salesman routing algorithm.

### Concept 2: AI Pets (*AI Pet*)
* **Team Pitch:** A chatbot/companion character (pet, dinosaur, or fantasy figure) where users learn AI logic by constructing a decision tree that controls behavior. Physical distribution was proposed via USB drives accompanied by 3D-printed figures so users can take the project home.
* **Guest Feedback:** Strongly supported the decision tree approach as transparent and realistic. The guest cautioned against Reinforcement Learning, noting that while it resembles rewarding/punishing a Tamagotchi, it is far too complex for a 15-minute open-day interaction. It could, however, serve as an advanced extension for students at home.

### Concept 3: Biometric Data in Healthcare (*Biometrie*)
* **Team Pitch:** A tactile desktop sensor measuring vitals (heart rate, blood pressure, oxygen saturation) feeding into a live dashboard showing real-time stats and daily averages, illustrating data applications in healthcare.
* **Guest Feedback:** Validated the real-world connection, citing prior projects involving smart toilets monitoring vitals and fitness systems comparing athletic performance to top 10% benchmarks. The guest stressed keeping the setup compact and fast to engage with.
* **Current Status:** The team acquired a heart rate sensor from the medialab, but configuration of blood pressure and oxygen sensors is still pending.

---

## 4. Prototype Status & Upcoming User Testing

* **Target Audience Testing Date:** Scheduled for **next Thursday**.
* **AI Pet Prototype Status:**
  * Bart built a logic engine using switch cases.
  * Jay built an interactive HTML version operating as an Akinator-style decision tree where the system asks binary trait questions (e.g., fur, extroverted) and can learn new animals dynamically.
  * *Team Agreement:* Present both variations to prospective students next week to gather broad qualitative feedback. Bart suggested outputting ASCII art of the resolved pet upon completion.
* **Biometric Sensor Prototype Status:** Wiring and code testing are required to get the medialab heart rate sensor functioning.
* **Train Prototype Status & Next Steps:** 
  * The team needs a physical moving vehicle or a digital simulation ready before next Tuesday.
  * Primary plan: Inquire with ESD lecturer Joost Kraaijenveld about borrowing an Arduino robot vehicle.
  * Fallbacks: An ASCII loop animation or a Processing-based moving square simulation.

---

## 5. Operations, Communications, & Plan van Aanpak (PvA)

### Scheduling & Faculty Communications
* **Unity Workshop (Bart Okups):** The team agreed a Unity workshop is essential for 3D simulation. They drafted an email to Bart Okups and Elisa requesting to move the session from November 5 to **Tuesday, October 29**, swapping it with Elisa's interview/ethics session.
* **Hardware Request (Joost Kraaijenveld):** Drafted and sent an inquiry to borrow an Arduino vehicle/track setup, citing references from Karel de Heer and Pim Hanna, with a pickup request for next Tuesday.
* **Participant Recruitment (Rick):** Email sent to Rick providing context for recruiting student test participants.
* **Major Curriculum Documents:** Charl shared course documentation via WhatsApp (*adviesrapport hoofdfase data en AI*, *hoofdrapportage v1*), which team members will review during upcoming travel.

### Jira & Project Management
* Excel issues are currently being migrated into Jira so the team can formally assign and manage work items.

### Review of the Plan van Aanpak (PvA) Template (Scribbr)
The team reviewed the standard Scribbr project plan structure and agreed on the following adaptations:
* **Title Page:** Must include the official **HAN logo** to satisfy the mandatory checklist evaluation criteria (*controlekaart / knockout*).
* **Introduction & Problem Definition:** Retained from existing project documentation.
* **Organizational Description (Mission/Vision):** Omitted or reduced to a brief note, as corporate-level HAN vision is not relevant to their internal team plan.
* **Demarcation (*Afbakening*):** Identified as critical; work will strictly terminate at the end of the minor period.
* **Planning:** A group-level Gantt chart must be finalized.
* **Math Level Observation:** A review of a TSD practice exam confirmed that the required data science mathematics consists of foundational statistics (mean, median, mode, Python scatter plots), which can be highlighted in outreach to reassure prospective students.

---

## 6. Action Items Summary

| Task / Deliverable | Responsible | Deadline / Target | Status |
| :--- | :--- | :--- | :--- |
| **Send hardware request email to Joost Kraaijenveld** (Arduino vehicle for Train concept) | Project Team | Immediate (Pickup by Tuesday) | Sent |
| **Send schedule swap request email to Bart Okups & Elisa** (Move Unity workshop to Oct 29) | Project Team | Immediate | Sent |
| **Send recruitment email to Rick** (Testing participants) | Project Team | Immediate | Sent |
| **Complete Jira import** from Excel and assign tasks | Project Team | Immediate | In Progress |
| **Wire & test biometric heart rate sensor** | Project Team | Before next Tuesday | Pending |
| **Add ASCII art output** to the HTML AI Pet prototype | Jay / Bart | Next Thursday | Planned |
| **Review curriculum documentation** sent by Charl | Individual members | Friday / weekend | In Progress |
| **Draft Plan van Aanpak components** (HAN logo, Gantt planning, demarcation) | Group | Ongoing | Planned |
| **Conduct Target Audience Testing Session** | Full Team | Next Thursday | Scheduled |

