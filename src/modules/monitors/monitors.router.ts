import { FastifyInstance } from "fastify";
import { getMonitorsOfAllLanesBySite } from "./monitors.controller";

export async function monitorsRouter(server: FastifyInstance) {
	server.get(
		"/:siteName",
		{
			schema: {
				params: {
					type: "object",
					properties: {
						siteName: { type: "string" },
					},
				},
			},
		},
		getMonitorsOfAllLanesBySite
	);
}
