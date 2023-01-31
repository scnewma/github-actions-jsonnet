.PHONY: github
github:
	jsonnet .github/raw/customized.jsonnet | yq -P > .github/workflows/main.yml
