MODEL ?= qwen3:8b

ollama_docker_cpu:
	docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
ollama_docker_amd:
	docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm
ollama_start:
	docker start ollama
ollama_run_model:
	docker exec -d ollama ollama run $(MODEL)
ollama_stop:
	docker stop ollama
run_server:
	cd server && cargo run --release
run_client:
	cd client && chmod +x ./run.sh && ./run.sh $(MODEL)
