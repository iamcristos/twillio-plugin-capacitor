declare module '@capacitor/core' {
  interface PluginRegistry {
    TwilioVideoViewController: TwilioVideoViewControllerPlugin;
  }
}

export interface TwilioVideoViewControllerPlugin {
  echo(options: {  roomName: String, token: String }): Promise<{ value: string }>;
  connect(options: { roomName: String, token: String}): Promise<any>;
}
