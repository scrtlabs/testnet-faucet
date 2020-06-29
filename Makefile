all: backend frontend
	cp backend/faucet bin/
	cp frontend/.env bin/
	cp frontend/.env.local bin/
	cp -r frontend/dist bin/

.PHONY: backend
backend:
	$(MAKE) -C backend all

.PHONY: frontend
frontend:
	$(MAKE) -C frontend all

run-local: frontend backend
	cp frontend/.env backend/
	cp frontend/.env.local backend/
	# cd backend && ./faucet
	cd frontend && yarn serve

clean:
	$(MAKE) -C backend clean
	$(MAKE) -C frontend clean
	rm -rf bin/* &>/dev/null
	rm -rf bin/.env bin/.env.local &>/dev/null