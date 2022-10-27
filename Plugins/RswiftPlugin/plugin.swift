//
//  RswiftPlugin.swift
//
//
//  Created by Quentin Fasquel on 01/04/2022.
//

import PackagePlugin
import Foundation

@main struct RswiftPlugin: BuildToolPlugin {
    /// This plugin's implementation returns a single `prebuild` command to run `rswift`.
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let outputPath = context.package.directory.appending(["Sources", "FalconTheme"])
        
        return [.prebuildCommand(
            displayName: "Running R.swift",
            executable: try context.tool(named: "rswift").path,
            arguments: [
                "generate", outputPath.appending("R.generated.swift"),
                "--swiftPackage", context.package.directory.string,
                "--target", target.name,
                "--accessLevel", "public"
            ],
            outputFilesDirectory: outputPath)]
    }
}
