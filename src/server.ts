import fastify from "fastify";

import { monitorsRouter, versionsRouter } from "./modules";
import { sitesRouter } from "./modules/sites/sites.router";
import { prismaPlugin, swaggerPlugin } from "./plugins";

const server = fastify({ logger: true });

async function start() {
	try {
		await server.register(prismaPlugin);
		await server.register(swaggerPlugin);

		await server.register(versionsRouter, { prefix: "api/versions" });
    await server.register(monitorsRouter, { prefix: "api/monitors" });
    await server.register(sitesRouter, { prefix: "api/sites" });

		await server.ready();
		await server.listen({ port: 3000 });
		console.log(`🚀 Server ready at: http://localhost:3000`);
	} catch (err) {
		server.log.error(err);
		process.exit(1);
	}
}

start();
