install:
	@swift build && yarn install
dev:
	@npm run dev
servre:
	@./.build/debug/swift-vue-start
build:
	@npm run build