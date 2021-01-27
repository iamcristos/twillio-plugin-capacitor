declare module '@capacitor/core' {
  interface PluginRegistry {
    TwilioVideoViewController: TwilioVideoViewControllerPlugin;
  }
}

export interface TwilioVideoViewControllerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  connect(options: { name: String, token: String}): Promise<any>;
}
