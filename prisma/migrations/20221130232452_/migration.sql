-- DropForeignKey
ALTER TABLE `Lane` DROP FOREIGN KEY `Lane_ibfk_1`;

-- DropForeignKey
ALTER TABLE `Version` DROP FOREIGN KEY `Version_ibfk_1`;

-- AddForeignKey
ALTER TABLE `Lane` ADD CONSTRAINT `Lane_siteId_fkey` FOREIGN KEY (`siteId`) REFERENCES `Site`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Version` ADD CONSTRAINT `Version_laneId_fkey` FOREIGN KEY (`laneId`) REFERENCES `Lane`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
