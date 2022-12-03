import fp from "fastify-plugin";
import { FastifyPluginAsync } from "fastify";
import swagger from "@fastify/swagger";
import swaggerui from "@fastify/swagger-ui";

export const swaggerPlugin: FastifyPluginAsync = fp(async (server, options) => {
  await server.register(swagger, {
    swagger: {
      info: {
        title: "SeeTrue App API",
        description: "SeeTrue App API Documentation",
        version: "0.1.0",
      },
    }
  });
	await server.register(swaggerui, {
		routePrefix: "/documentation",
		uiConfig: {
			deepLinking: true,
			showExtensions: true,
			layout: "BaseLayout",
		},
		uiHooks: {
			onRequest: function (request, reply, next) {
				next();
			},
			preHandler: function (request, reply, next) {
				next();
			},
		},
		staticCSP: true,
		transformStaticCSP: (header) => header,
		transformSpecification: (swaggerObject, request, reply) => {
			return swaggerObject;
		},
		transformSpecificationClone: true,
	});

	server.ready((err) => {
		if (err) throw err;
		server.swagger();
	});
});
