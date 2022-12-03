import { FastifyRequest } from "fastify/types/request";

type GetMonitorsRequest = FastifyRequest<{
	Params: {
		siteName: string;
	};
}>;

export async function getMonitorsOfAllLanesBySite(request: GetMonitorsRequest) {
	const { siteName } = request.params;
	const monitors = await request.server.prisma.site.findFirst({
		where: {
			siteName,
		},
		include: {
			lanes: {
				select: {
					laneName: true,
					screenshot_url: true,
				},
			},
		},
	});
	return monitors;
}
