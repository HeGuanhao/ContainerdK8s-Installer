ARCH ?= all

package:
	@set -e; \
	export ARCH=$(ARCH); \
	script_path=$$(find . -name packageDownload.sh); \
	if [ -n "$$script_path" ]; then \
		chmod +x $$script_path; \
		$$script_path; \
	else \
		echo "packageDownload.sh not found in current directory."; \
	fi

image:
	@set -e; \
	export ARCH=$(ARCH); \
	script_path=$$(find . -name imageDownload.sh); \
	if [ -n "$$script_path" ]; then \
		chmod +x $$script_path; \
		$$script_path; \
	else \
		echo "imageDownload.sh not found in current directory."; \
	fi
