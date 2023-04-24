# Turo Terraform Development Standards {{ git_latest_release }}

## Baseline standards

We use the following standards as a baseline for all Terraform code at Turo:

- [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Rebase & Merge](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-request-merges#rebase-and-merge-your-pull-request-commits)
  workflow
- [pre-commit](https://pre-commit.com/) for linting
- [mkdocs](https://www.mkdocs.org/) for documentation -- For full documentation
  visit [mkdocs.org](https://www.mkdocs.org).
- Formatting -- all files are formatted using appropriate language specific tools during the pre-commit phase to ensure
  baseline style is consistent.
- Terraform Documentation -- all Terraform code is documented using the [terraform_docs](https://terraform-docs.io/)
- Standards are enforced with code whereever possible. For example, we use [pre-commit](https://pre-commit.com/) to
  enforce
  formatting and linting standards.
- Scripts to rule them all -- we use [scripts to rule them all](https://github.com/github/scripts-to-rule-them-all) to
  provide consistent usage and functionality across all repositories.
