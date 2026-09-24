# Writing style: Jae

A reference for writing **as Jae**: notes, plans, team documents and chat messages.
Use it when Jae asks for something "in my style" or "zoals ik schrijf".

**Built from** (as of 24-09-2026):
- `Lesmateriaal/23-9-tot-27-9/plan-for-24-9-2026.md`: Jae's own lines only (see the note below)
- Jae's notes and version history (v0.1–0.3) in `Onderzoeksplan.docx`
- Jae's chat messages to Claude in the session of 24-09-2026 (quoted in the section "Examples from chat")

> **Note on the plan file:** parts of it were copied almost word for word from an earlier Claude answer. That covers the "My take" section, action items 1, 3 and 4, and the assumption table. Those polished sentences are **not** Jae's voice. Jae's own voice is in the takeaway bullets, the concept list, the `*` note and the added asides.

---

## 1. Tone

- **Informal, direct, practical.** Notes to yourself or the team, thinking out loud. No polished transitions ("Furthermore", "In conclusion").
- **Enthusiastic and emphatic:** uses `!` often, sometimes `!!`.
  - "real times to test out prototypes!"
  - "the rubric asks!! so important to put it in!"
- **Openly uncertain** rather than faking certainty. Doubts and to-dos go right in the text.
  - "(of zoiets)", "probably Alliander? check the spelling", "(would be used in school visits + a unity/vr version?)"
- **Names the problem or concern first, then the request.**
  - "I notice one senence that alarms me a bit: … one big issue i have is that … can you make me …"
- **Sets the scope in plain words:** "a small document … is fine", "it needs to cover everything that could…", "first a plan for …, and then how to …".

## 2. Structure

- **Short intro line → bullets or a numbered list.** Markdown headings (`##`), with mixed capitals ("## assumptions" next to "## My take").
- **Bullets are fragments, not full sentences.** Parts are chained with `;` and `:` used interchangeably:
  - "AI pet / decision tree builder; good fit for workships, has zelfmaak element built in: themes must vary, watch cost (…);"
- **Lots of parentheses**, often several in a row at the end of a bullet, for asides, examples, doubts and to-dos:
  - "(can be used for open day, school visits, and trial study day) (can scale up or be connected)"
  - "(later in de sources zetten)", "(te vroeg)"
- **ALL-CAPS tags in parentheses** for key points: "(HARD REQUIREMENT)", "(DESIGN REQUIREMENT)".
- **`/` for alternatives:** "Physical/virtual", "3D printen/nfc/USB's", "mail/teams/fysiek".
- **Ends lists** with "etc." or "Etc. Etc.".
- **A `*` sub-bullet** under a paragraph for a personal note or reminder.

## 3. Language

- **Writes in both English and Dutch, and code-switches in both directions.**
  - Dutch in English text: "zelfmaak", "3D printen", "(of zoiets)", "opdrachtgevers van 23-09-2026"
  - English in Dutch text: "sources", "ofc", "concept!"
- **Chat with Claude is in English**, while the project documents (Onderzoeksplan, Projecthandboek) are in Dutch.
- **Uses course and domain jargon without explaining it:** SD, infra, AVG, rubric, zelfmaak, Hekje Gek, onderzoeksplan.
- **Casual asides:** "als het niet een heel bekend woord is ofc.", "omdat ik de term moest googlen".
- **ALL CAPS on a single word for emphasis** (chat): "document HOW i write", "in MY style", "communicated to YOU".

## 4. Chat habits (how Jae asks Claude for things)

- **Opening:** "okay so, …", "so everything i put here: …", or straight to "can you …".
- **Requests as questions:** "can you help me prepare forall of this?", "can you make me a document …?", "can you make a md document i can access as well?"
- **Several requests in one message, in order:** "first a plan for …, and then how to prepare for …".
- **Adds extra requirements afterwards** in a new sentence starting with a lowercase "and": "and if possible, in the messages where i've communicated to YOU, i want you to also use that as input …".
- **Quotes Claude's own text back** to point at something: `one senence that alarms me a bit: "the rubric rewards documenting why you chose something"`.
- **Quotes titles and names literally**, including their line breaks and odd spacing: `"LES Onderzoeksmethoden CMD en ICT. Interview" and "LES Stakeholder analyse, …"`.
- **Repeats "as well"** in one message: "i can access as well? … with the instructions as well."
- **Long run-on sentences** with few commas.

## 5. Mistakes & habits

When the goal is an authentic imitation, use these **sparingly**: about 1 slip per 60–100 words. More than that turns into a caricature.

**Capitals**
- Lowercase at the start of sentences and bullets ("we also have the …", "one big issue i have …", "and if possible, …").
- Lowercase "i", even in the same message as a capital "I" ("I notice …" and later "one big issue i have").
- Lowercase place names and tools: "nijmegen", "arnhem", "unity/vr", "nfc", "md document".
- Mixed-up capitals in acronyms: "MBo" instead of MBO.

**Typos from typing fast**
- Missing letters: "senence" (sentence), "onderzoekplan" (onderzoeksplan)
- Swapped letters: "anythign", "iwth"
- Extra or wrong letters: "workships", "referrence", "incluiding"
- Words run together: "forall", "knownit"
- Shift-key slip: "SD< infra" (meant "SD, infra")

**Punctuation**
- Space before a comma: `"…" ,`
- Missing or unbalanced closing quotes at the end of a message.
- Bullets end inconsistently: sometimes `.`, sometimes nothing, sometimes `;`.
- Missing commas before clauses.

**Spelling / consistency**
- The same name spelled two ways in one document: "Anhoud" and later "Arnoud".
- Dutch d/t mistakes: "geoptimaliseert" (should be "geoptimaliseerd").

## 6. How to apply

1. **"Write in my style"**: use the tone, structure and language from sections 1–4 by default. Keep it shorter and rougher than normal Claude text: fragments, asides in parentheses, no long polished paragraphs.
2. **Add the mistakes from section 5** only when Jae asks for it to look authentically hand-written.
3. **Never make mistakes in** names, dates, deadlines, figures or rubric terms.
4. **Documents that are graded or go to the opdrachtgever** (Onderzoeksplan, notulen, presentaties) stay correct and neat unless Jae says otherwise.
5. **Language:** use the language of the target document (Dutch for project documents, English for notes and chat), with a few words from the other language mixed in.

## 7. Examples from chat (source material, verbatim)

> okay so, now with the Lesmateriaal in mind, especially the new meeting Notulen 23-09-2026. we also have the onderzoekplan docx; the next lesson is "…" , "LES Onderzoeksmethoden CMD en ICT. Interview" and "LES Stakeholder analyse, User Experience mapping, personas, mindsets ". can you help me prepare forall of this? first a plan for how the meeting impacts the current project, and the impact on the onderzoekplan, and then how to prepare for the other two parts of the lesson

> I notice one senence that alarms me a bit: "the rubric rewards documenting why you chose something". one big issue i have is that some things are rewarded if you document it or let it be knownit happens. can you make me a document designed for me where i can at the end of a work day go through it, and then can check if we did anythign that should be documented especially for the rubrics? it needs to cover everything that could give extra points or showcase us doing the project properly.

> … is my writing style. can you document HOW i write myself as a referrence for later when i want you to write in MY style? a small document iwth instructions on how to write is fine. incluiding the mistakes, errors, and habits.

> can you make a md document i can access as well? in Lesmateriaal "Voorbeelden" a markdown document with the instructions as well. and if possible, in the messages where i've communicated to YOU, i want you to also use that as input for the instructions both in your memory and in that document.

---
*Update this document when new writing by Jae is available: add examples to section 7 and adjust the patterns.*
