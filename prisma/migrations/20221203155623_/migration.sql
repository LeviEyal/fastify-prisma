-- DropForeignKey
ALTER TABLE `Version` DROP FOREIGN KEY `Version_laneName_siteName_fkey`;

-- DropIndex
DROP INDEX `Lane_laneName_siteName_key` ON `Lane`;

-- AddForeignKey
ALTER TABLE `Version` ADD CONSTRAINT `Version_siteName_laneName_fkey` FOREIGN KEY (`siteName`, `laneName`) REFERENCES `Lane`(`siteName`, `laneName`) ON DELETE RESTRICT ON UPDATE CASCADE;
