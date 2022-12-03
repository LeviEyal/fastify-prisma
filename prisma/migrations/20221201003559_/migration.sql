-- DropForeignKey
ALTER TABLE `Lane` DROP FOREIGN KEY `Lane_monitorId_fkey`;

-- AddForeignKey
ALTER TABLE `Lane` ADD CONSTRAINT `Lane_monitorId_fkey` FOREIGN KEY (`monitorId`) REFERENCES `Monitor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
