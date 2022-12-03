import { Prisma } from "@prisma/client";
import { FastifyInstance } from "fastify";
import { getAllSites } from "./sites.controller";

export async function sitesRouter(server: FastifyInstance) {
	server.route({
		method: "GET",
		url: "/",
		schema: {
			response: {
				200: {
					type: "array",
					items: {
						type: "object",
						properties: {
							siteName: { type: "string" },
						},
					},
				},
			},
			tags: ["sites"],
			summary: "Get a list with all sites names",
		},
		handler: getAllSites,
	});

	server.route({
		method: "GET",
		url: "/:siteName",
		schema: {
			tags: ["sites"],
			summary: "Get a site by name",
			params: {
				type: "object",
				properties: {
					siteName: { type: "string" },
				},
			},
		},
		handler: async (request, reply) => {
			const { siteName } = request.params as { siteName: string };
			const site = await server.prisma.site.findUnique({
				where: { siteName },
				include: {
					lanes: true,
				},
			});
			return site;
		},
	});

	server.route({
		method: "GET",
		url: "/:siteName/versions",
		schema: {
			tags: ["sites"],
			summary: "Get a list with all versions for a site by lane",
			params: {
				type: "object",
				properties: {
					siteName: { type: "string" },
				},
			},
			querystring: {
				type: "object",
				properties: {
					lane: { type: "string" },
				}
			}
		},
		handler: async (request, reply) => {
			const { siteName } = request.params as { siteName: string };
			const site = await server.prisma.site.findUnique({
				where: { siteName },
				select: {
					lanes: {
						select: {
							laneName: true,
							versions: {
								select: {
									version: true,
									package: true,
								},
							},
						},
					},
				},
			});
			return site;
		},
	});
				
}
