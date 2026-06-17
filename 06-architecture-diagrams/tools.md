# Architecture Diagramming Tools

Reference guide for creating and storing AWS architecture diagrams.

## Recommended Tools

- **[draw.io / diagrams.net](https://app.diagrams.net/)** — free, browser-based, AWS icon library built in; export to SVG/PNG/XML; integrates with GitHub
- **[Lucidchart](https://lucidchart.com/)** — collaborative; AWS shape library; real-time multiplayer editing
- **[Cloudcraft](https://www.cloudcraft.co/)** — renders actual AWS resources from your account; auto-generates cost estimates from the diagram
- **[AWS Application Composer](https://aws.amazon.com/application-composer/)** — visual IaC designer; generates CloudFormation/SAM templates from the diagram
- **[Mermaid](https://mermaid.js.org/)** — text-based diagrams in Markdown; good for flowcharts and sequence diagrams in docs/READMEs

## AWS Icon Sets

- Official AWS icon set (PowerPoint, SVG): https://aws.amazon.com/architecture/icons/
- draw.io has an embedded AWS shape library — enable via Extras → Edit Diagram or the search bar

## Diagram Conventions

- Use the official AWS service icons (not generic cloud icons)
- Annotate arrows with protocol and port (e.g., HTTPS:443)
- Show AZ boundaries as dashed boxes
- Group resources in VPC/subnet boxes
- Include a legend for custom shapes or colours

## Diagrams to Create for This Repo

- [ ] Three-tier web app (Project 01) — full network topology
- [ ] Serverless SaaS (Project 02) — Lambda + API GW + Cognito flow
- [ ] Data platform (Project 03) — ingestion + processing + query flow
- [ ] Multi-account landing zone — OU structure + network hub
- [ ] DR strategy comparison — Pilot Light vs. Warm Standby
