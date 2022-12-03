-- DropIndex
DROP INDEX `Version_package_version_laneName_siteName_key` ON `Version`;

-- AlterTable
ALTER TABLE `Version` ADD PRIMARY KEY (`package`, `laneName`, `siteName`);
