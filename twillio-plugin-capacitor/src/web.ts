import { WebPlugin } from '@capacitor/core';
import { TwilioVideoViewControllerPlugin } from './definitions';

export class TwilioVideoViewControllerWeb extends WebPlugin implements TwilioVideoViewControllerPlugin {
  constructor() {
    super({
      name: 'TwilioVideoViewController',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async connect(options: {  roomName: String | null, token: String | null}): Promise<any> {
    console.log('Connect', options);
    // return options;
  }
}

const TwilioVideoViewController = new TwilioVideoViewControllerWeb();

export { TwilioVideoViewController };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(TwilioVideoViewController);
